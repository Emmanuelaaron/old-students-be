module Api
  module V1
    class NextOfKinsController < ApplicationController
      before_action :authenticate_member!
      before_action :require_approved!
      before_action :set_next_of_kin, only: %i[update destroy]

      def index
        render json: {
          nextOfKins: current_member.next_of_kins.order(:name),
          relationships: NextOfKin::RELATIONSHIPS
        }
      end

      def create
        nok = current_member.next_of_kins.new(next_of_kin_params)

        if nok.save
          render json: { nextOfKin: nok }, status: :created
        else
          render json: { error: nok.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      end

      def update
        if @next_of_kin.update(next_of_kin_params)
          render json: { nextOfKin: @next_of_kin }
        else
          render json: { error: @next_of_kin.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      end

      def destroy
        @next_of_kin.destroy!
        head :no_content
      end

      private

      def set_next_of_kin
        @next_of_kin = current_member.next_of_kins.find(params[:id])
      end

      def next_of_kin_params
        params.permit(:name, :telephone, :email, :relationship, :tel).tap do |p|
          p[:telephone] ||= p.delete(:tel) if p[:tel].present?
        end
      end
    end
  end
end
