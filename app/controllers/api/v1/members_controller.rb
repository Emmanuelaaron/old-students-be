module Api
  module V1
    class MembersController < ApplicationController
      before_action :authenticate_member!, except: [:stats]
      before_action :require_admin!, except: [:stats, :show, :role_history]
      before_action :set_member, only: %i[show approve destroy assign_role role_history]

      def index
        members = Member.approved.order(:last_name, :first_name)
        members = members.where("first_name LIKE :q OR last_name LIKE :q OR email LIKE :q OR occupation LIKE :q", q: "%#{params[:q]}%") if params[:q].present?
        render json: { members: members }
      end

      def pending
        render json: { members: Member.pending.order(joined_at: :desc) }
      end

      def show
        unless current_member.admin? || current_member.id == @member.id
          return render json: { error: "Forbidden" }, status: :forbidden
        end

        render json: { member: @member }
      end

      def approve
        @member.update!(approved: true)
        begin
          MemberMailer.approved(@member).deliver_now
        rescue StandardError => e
          Rails.logger.error("Approval email failed for member #{@member.id}: #{e.message}")
        end
        render json: { member: @member }
      end

      def assign_role
        new_role = params.require(:role)
        unless Member.roles.key?(new_role)
          return render json: { error: "Invalid role. Choose from: #{Member.roles.keys.join(', ')}" }, status: :unprocessable_entity
        end
        if @member == current_member
          return render json: { error: "The chairperson cannot reassign themselves." }, status: :unprocessable_entity
        end

        @member.assign_role!(new_role, appointed_by: current_member, force: params[:force].to_s == "true")
        render json: { member: @member, role_history: @member.role_histories.order(created_at: :desc) }
      rescue Member::RoleOccupiedError => e
        render json: {
          error: "#{e.current_holder.full_name} is currently the #{new_role.humanize}.",
          currentHolder: {
            id: e.current_holder.id,
            fullName: e.current_holder.full_name,
            role: e.current_holder.role,
          },
          needsConfirmation: true,
        }, status: :conflict
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def role_history
        unless current_member.admin? || current_member.id == @member.id
          return render json: { error: "Forbidden" }, status: :forbidden
        end

        render json: { role_history: @member.role_histories.order(started_at: :desc) }
      end

      def officers
        render json: { members: Member.officers.approved.order(:last_name, :first_name) }
      end

      def destroy
        if @member.admin?
          return render json: { error: "Cannot remove an administrator" }, status: :unprocessable_entity
        end

        @member.destroy!
        head :no_content
      end

      def stats
        render json: {
          approvedCount: Member.approved.count,
          monthlyContribution: Contribution::MONTHLY_AMOUNT,
          fineAmount: Contribution::FINE_AMOUNT,
          fineRate: Contribution::FINE_RATE,
          annualSubscriptionAmount: AnnualSubscription::AMOUNT
        }
      end

      private

      def set_member
        @member = Member.find(params[:id])
      end
    end
  end
end
