module Authenticable
  extend ActiveSupport::Concern

  private

  def authenticate_member!
    token = bearer_token
    @current_member = Member.find_by(api_token: token) if token.present?

    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_member
  end

  def current_member
    @current_member
  end

  def require_admin!
    return if current_member&.admin?

    render json: { error: "Admin access required" }, status: :forbidden
  end

  def require_approved!
    return if current_member&.approved? || current_member&.admin?

    render json: { error: "Membership pending approval" }, status: :forbidden
  end

  def require_officer!
    return if current_member&.officer?

    render json: { error: "Officer access required" }, status: :forbidden
  end

  def bearer_token
    header = request.headers["Authorization"].to_s
    header.split(" ", 2).last if header.start_with?("Bearer ")
  end
end
