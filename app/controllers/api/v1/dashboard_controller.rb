module Api
  module V1
    class DashboardController < ApplicationController
      before_action :authenticate_member!
      before_action :require_officer!

      def overview
        this_month = Time.current.strftime("%Y-%m")
        this_year = AnnualSubscription.current_year
        approved = Member.approved
        paid_ids = Contribution.approved.for_month(this_month).pluck(:member_id)
        unpaid_fines = Contribution.unpaid_fines
        annual_paid_ids = AnnualSubscription.approved.for_year(this_year).pluck(:member_id)

        render json: {
          totalMembers: approved.count,
          pendingApprovals: Member.pending.count,
          pendingContributionReports: Contribution.pending_approval.count,
          collectedThisMonth: Contribution.approved.for_month(this_month).sum(:amount),
          outstandingFines: unpaid_fines.count,
          notPaidThisMonth: approved.where.not(id: paid_ids).order(:last_name, :first_name),
          month: this_month,
          currentYear: this_year,
          annualSubscriptionAmount: AnnualSubscription::AMOUNT,
          paidAnnualSubscriptions: annual_paid_ids.count,
          unpaidAnnualSubscribers: approved.where.not(id: annual_paid_ids).count,
          collectedAnnualSubscriptions: AnnualSubscription.approved.for_year(this_year).sum(:amount)
        }
      end
    end
  end
end
