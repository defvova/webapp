class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP, length: { maximum: 50 }
  validates :password, presence: true, confirmation: true, length: { in: 6..50 }
  validates :password_confirmation, presence: true, length: { in: 6..50 }, if: :password_digest_changed?

  normalizes :email, with: ->(e) { e.strip.downcase }
end
