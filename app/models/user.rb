class User < ApplicationRecord

  before_save { email.downcase! }
  before_save { username.downcase! }



  validates :username, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
has_secure_password
end
