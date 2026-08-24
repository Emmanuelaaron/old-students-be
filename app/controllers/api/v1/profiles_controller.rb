module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :authenticate_member!
      before_action :require_approved!

      def show
        render json: {
          member: current_member.as_json(include_next_of_kins: true),
          relationships: NextOfKin::RELATIONSHIPS
        }
      end

      def update
        if current_member.update(profile_params)
          render json: { member: current_member.as_json(include_next_of_kins: true) }
        else
          render json: { error: current_member.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      end

      private

      def profile_params
        params.permit(
          :first_name, :last_name, :occupation, :date_of_birth,
          :tel, :address, :gender, :email,
          :firstName, :lastName, :dateOfBirth
        ).tap do |p|
          p[:first_name] ||= p.delete(:firstName)
          p[:last_name] ||= p.delete(:lastName)
          p[:date_of_birth] ||= p.delete(:dateOfBirth)
        end
      end
    end
  end
end
