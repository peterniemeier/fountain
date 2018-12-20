# == Schema Information
#
# Table name: jobs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string           not null
#  employer_id :integer          not null
#

class Job < ApplicationRecord
  validates :title, :description, :employer_id, presence: true

  has_many :applications
  has_many :applicants,
    through: :applications,
    source: :user
  belongs_to :employer,
    foreign_key: :employer_id,
    class_name: :User
end
