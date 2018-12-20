class Job < ApplicationRecord
  validates :title, :description, :employer_id, presence: true

  has_many: :applications
  has_many: :applicants,
    through: :applications,
    source: :user
  belongs_to: :employer,
    foreign_key: :employer_id,
    class_name: :User
end
