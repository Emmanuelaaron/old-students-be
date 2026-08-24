module Api
  module V1
    class AnnualSubscriptionsController < ApplicationController
      before_action :authenticate_member!
      before_action :require_approved!
      before_action :require_admin!, only: %i[index create approve reject unpaid]
      before_action :set_annual_subscription, only: %i[approve reject]

      def index
        subscriptions = AnnualSubscription.includes(:member).recent_first
        subscriptions = subscriptions.for_year(params[:year]) if params[:year].present?
        render json: { annual_subscriptions: subscriptions }
      end

      def mine
        render json: {
          annual_subscriptions: current_member.annual_subscriptions.recent_first
        }
      end

      def unpaid
        year = params[:year].presence || AnnualSubscription.current_year
        paid_ids = AnnualSubscription.approved.for_year(year).select(:member_id)
        members = Member.approved.where.not(id: paid_ids).order(:last_name, :first_name)
        render json: {
          year: year.to_i,
          amount: AnnualSubscription::AMOUNT,
          unpaid_members: members
        }
      end

      def create
        member = Member.approved.find(annual_subscription_params[:member_id])
        subscription = member.annual_subscriptions.new(annual_subscription_params.except(:member_id))

        if subscription.save
          render json: { annual_subscription: subscription }, status: :created
        else
          render json: { error: subscription.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      end

      def approve
        @annual_subscription.update!(status: "approved")
        render json: { annual_subscription: @annual_subscription }
      end

      def reject
        @annual_subscription.destroy!
        head :no_content
      end

      private

      def set_annual_subscription
        @annual_subscription = AnnualSubscription.find(params[:id])
      end

      def annual_subscription_params
        params.permit(:member_id, :year, :paid_at, :status)
      end
    end
  end
end
