module Api
  module V1
    class AuthController < ApplicationController
      before_action :authenticate_member!, only: %i[me logout]

      def register
        attrs = register_params
        noks_params = Array(attrs.delete(:next_of_kins)).filter_map do |nok|
          next unless nok.is_a?(ActionController::Parameters)

          nok[:telephone] ||= nok.delete(:tel) if nok[:tel].present?
          nok.permit(:name, :telephone, :email, :relationship).to_h
        end

        member = Member.new(attrs.merge(approved: false))

        ActiveRecord::Base.transaction do
          unless member.save
            raise ActiveRecord::RecordInvalid.new(member)
          end

          noks_params.each do |nok|
            next if nok.values.all?(&:blank?)
            member.next_of_kins.create!(nok)
          end
        end

        begin
          MemberMailer.welcome(member).deliver_now
        rescue StandardError => e
          Rails.logger.error("Welcome email failed for member #{member.id}: #{e.message}")
        end

        render json: { token: member.api_token, member: member.as_json(include_next_of_kins: true) }, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.record.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end

      # POST /auth/request_otp { identifier: email or phone }
      def request_otp
        identifier = params[:identifier].presence || params[:email].presence || params[:tel].presence
        member = Member.find_by_identifier(identifier)

        unless member
          return render json: { error: "No account found for that email or phone number." }, status: :not_found
        end

        _otp, code = LoginOtp.issue_for!(member)

        begin
          MemberMailer.login_otp(member, code).deliver_now
        rescue StandardError => e
          Rails.logger.error("OTP email failed for member #{member.id}: #{e.message}")
          Rails.logger.info("[DEV OTP] #{member.email} => #{code}") if Rails.env.development?
          unless Rails.env.development?
            return render json: {
              error: "Could not send the login code. Please try again shortly."
            }, status: :service_unavailable
          end
        end

        Rails.logger.info("[DEV OTP] #{member.email} => #{code}") if Rails.env.development?

        render json: {
          message: "A one-time password has been sent to your email.",
          emailHint: mask_email(member.email),
          emailHint: mask_email(member.email)
        }
      rescue StandardError => e
        Rails.logger.error("request_otp failed: #{e.class}: #{e.message}\n#{e.backtrace&.first(8)&.join("\n")}")
        render json: { error: e.message }, status: :internal_server_error
      end

      # POST /auth/verify_otp { identifier, code }
      def verify_otp
        identifier = params[:identifier].presence || params[:email].presence || params[:tel].presence
        code = params[:code].to_s.strip
        member = Member.find_by_identifier(identifier)

        unless member
          return render json: { error: "No account found for that email or phone number." }, status: :not_found
        end

        otp = member.login_otps.active.order(created_at: :desc).first
        unless otp&.authenticate(code)
          return render json: { error: "Invalid or expired code. Please request a new one." }, status: :unauthorized
        end

        member.regenerate_api_token! if member.api_token.blank?
        render json: {
          token: member.api_token,
          member: member.as_json(include_next_of_kins: true),
          relationships: NextOfKin::RELATIONSHIPS
        }
      end

      # Kept for backward compatibility — redirects clients to OTP flow
      def login
        render json: {
          error: "Password login is no longer supported. Request a one-time password instead."
        }, status: :gone
      end

      def me
        render json: {
          member: current_member.as_json(include_next_of_kins: true),
          relationships: NextOfKin::RELATIONSHIPS
        }
      end

      def logout
        current_member.clear_api_token!
        head :no_content
      end

      private

      def register_params
        p = params.permit(
          :first_name, :last_name, :occupation, :date_of_birth,
          :tel, :address, :gender, :email,
          :firstName, :lastName, :dateOfBirth,
          next_of_kins: [:name, :telephone, :email, :relationship, :tel],
          nextOfKins: [:name, :telephone, :email, :relationship, :tel]
        )

        p[:first_name] ||= p.delete(:firstName)
        p[:last_name] ||= p.delete(:lastName)
        p[:date_of_birth] ||= p.delete(:dateOfBirth)

        if p[:nextOfKins].present? && p[:next_of_kins].blank?
          p[:next_of_kins] = p.delete(:nextOfKins)
        end

        p
      end

      def mask_email(email)
        local, domain = email.to_s.split("@", 2)
        return email if local.blank? || domain.blank?

        visible = local[0, 1]
        "#{visible}#{'*' * [local.length - 1, 1].max}@#{domain}"
      end
    end
  end
end
