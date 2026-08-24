class NextOfKin < ApplicationRecord
  RELATIONSHIPS = [
    "Spouse",
    "Parent",
    "Father",
    "Mother",
    "Sibling",
    "Brother",
    "Sister",
    "Child",
    "Son",
    "Daughter",
    "Guardian",
    "Grandparent",
    "Aunt",
    "Uncle",
    "Cousin",
    "Friend",
    "In-law",
    "Other"
  ].freeze

  belongs_to :member

  validates :name, :telephone, :relationship, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :relationship, inclusion: { in: RELATIONSHIPS }

  def as_json(options = {})
    super(
      options.merge(only: %i[id member_id name telephone email relationship created_at updated_at])
    ).tap do |hash|
      hash["memberId"] = member_id
    end
  end
end
