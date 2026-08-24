module Api
  module V1
    class ContributionsController < ApplicationController
      before_action :authenticate_member!
      before_action :require_approved!
      before_action :require_officer!, only: %i[
        create unpaid_fines mark_fine_paid pending_reports approve_report reject_report
      ]
      before_action :set_contribution, only: %i[mark_fine_paid approve_report reject_report proof]
      before_action :authorize_proof_access!, only: :proof

      def index
        contributions =
          if current_member.officer?
            Contribution.includes(:member).with_attached_proof_of_payment.recent_first
          else
            current_member.contributions.where(status: %w[pending approved])
              .with_attached_proof_of_payment.recent_first
          end

        contributions = contributions.limit(params[:limit].to_i) if params[:limit].present?

        render json: { contributions: contributions }
      end

      # Admin records a payment (auto-approved)
      def create
        member = Member.approved.find(contribution_params[:member_id] || contribution_params[:memberId])
        contribution = member.contributions.new(
          month: contribution_params[:month],
          paid_at: contribution_params[:paid_at] || contribution_params[:paidAt],
          status: "approved"
        )

        if contribution.save
          render json: { contribution: contribution }, status: :created
        else
          render json: { error: contribution.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      end

      # Member reports payment(s) with proof of payment (needs admin approval)
      def report
        months = parse_months
        paid_at = params[:paid_at].presence || params[:paidAt].presence
        proof = params[:proof]

        if months.empty?
          return render json: { error: "Select at least one month" }, status: :unprocessable_entity
        end

        if paid_at.blank?
          return render json: { error: "Payment date is required" }, status: :unprocessable_entity
        end

        unless proof.respond_to?(:tempfile)
          return render json: { error: "Proof of payment image is required" }, status: :unprocessable_entity
        end

        unless Contribution::ALLOWED_PROOF_TYPES.include?(proof.content_type.to_s)
          return render json: { error: "Proof must be a JPEG, PNG, WebP, or GIF image" }, status: :unprocessable_entity
        end

        created = []
        ActiveRecord::Base.transaction do
          blob = ActiveStorage::Blob.create_and_upload!(
            io: proof.tempfile,
            filename: proof.original_filename,
            content_type: proof.content_type
          )

          months.each do |month|
            contribution = current_member.contributions.create!(
              month: month,
              paid_at: paid_at,
              status: "pending"
            )
            contribution.proof_of_payment.attach(blob)
            created << contribution
          end
        end

        render json: { contributions: created }, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.record.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end

      def pending_reports
        reports = Contribution.pending_approval
          .includes(:member)
          .with_attached_proof_of_payment
          .order(created_at: :desc)
        render json: { contributions: reports }
      end

      def approve_report
        @contribution.approve_report!
        render json: { contribution: @contribution }
      rescue RuntimeError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def reject_report
        @contribution.reject_report!
        head :no_content
      rescue RuntimeError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def unpaid_fines
        fines = Contribution.unpaid_fines.includes(:member).recent_first
        render json: { contributions: fines }
      end

      def mark_fine_paid
        @contribution.mark_fine_paid!
        render json: { contribution: @contribution }
      rescue RuntimeError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def mine
        render json: {
          contributions: current_member.contributions
            .where(status: %w[pending approved])
            .with_attached_proof_of_payment
            .recent_first
        }
      end

      def proof
        unless @contribution.proof_of_payment.attached?
          return head :not_found
        end

        blob = @contribution.proof_of_payment.blob
        send_data @contribution.proof_of_payment.download,
                  type: blob.content_type,
                  disposition: "inline",
                  filename: blob.filename.to_s
      end

      private

      def set_contribution
        @contribution = Contribution.find(params[:id])
      end

      def authorize_proof_access!
        return if current_member.officer? || @contribution.member_id == current_member.id

        render json: { error: "Forbidden" }, status: :forbidden
      end

      def contribution_params
        params.permit(:member_id, :memberId, :month, :paid_at, :paidAt)
      end

      def parse_months
        raw =
          if params[:months].present?
            Array(params[:months])
          elsif params[:month].present?
            Array(params[:month])
          else
            []
          end

        raw.flatten.map(&:to_s).map(&:strip).reject(&:blank?).uniq
      end
    end
  end
end
