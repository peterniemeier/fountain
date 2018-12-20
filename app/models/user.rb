# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  user_type       :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord
  validates :username, :email, :password_digest, :user_type, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :applications
  has_many :job_listings,
    foreign_key: :employer_id,
    class_name: :Job
  has_many :jobs_applied_to,
    through: :applications,
    source: :job
  has_many :job_applicants,
    through: :job_listings,
    source: :applicants

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
