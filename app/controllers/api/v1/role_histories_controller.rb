module Api
  module V1
    class RoleHistoriesController < ApplicationController
      before_action :authenticate_member!
      before_action :require_admin!, only: [:index]

      def index
        histories = RoleHistory.includes(:member, :appointed_by)
          .order(started_at: :desc)
        render json: { role_histories: histories }
      end
    end
  end
end
