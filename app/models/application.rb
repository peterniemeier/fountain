# == Schema Information
#
# Table name: applications
#
#  id      :bigint(8)        not null, primary key
#  job_id  :integer          not null
#  user_id :integer          not null
#

class Application < ApplicationRecord
  validates :job_id, :user_id, presence: true
  belongs_to :user
  belongs_to :job
end
