class ApplicationController < ActionController::API
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: "Not found" }, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.record.errors.full_messages.to_sentence }, status: :unprocessable_entity
  end
end
