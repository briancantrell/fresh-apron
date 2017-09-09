require 'securerandom'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_one :profile
  has_many :meals

  before_create :set_auth_token
  after_create :create_profile

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

  def create_profile
    return if profile.present?
    Profile.create(user: self)
  end
end
