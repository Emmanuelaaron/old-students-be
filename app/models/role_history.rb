class RoleHistory < ApplicationRecord
  belongs_to :member
  belongs_to :appointed_by, class_name: "Member"

  validates :role, :started_at, presence: true
  validates :role, inclusion: { in: Member.roles.keys }

  scope :current, -> { where(ended_at: nil).order(started_at: :desc) }
  scope :past, -> { where.not(ended_at: nil).order(ended_at: :desc) }

  def as_json(options = {})
    super(
      options.merge(
        only: %i[id role started_at ended_at created_at updated_at],
        include: {
          member: { only: %i[id first_name last_name], methods: [:full_name] },
          appointed_by: { only: %i[id first_name last_name], methods: [:full_name] }
        }
      )
    ).tap do |hash|
      hash["startedAt"] = started_at&.iso8601
      hash["endedAt"] = ended_at&.iso8601
      hash["createdAt"] = created_at&.iso8601
      hash["updatedAt"] = updated_at&.iso8601
    end
  end
end
