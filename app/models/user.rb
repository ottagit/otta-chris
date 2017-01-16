class User < ApplicationRecord
  # use before_save callback to downcase the email attribute
  # before saving the user
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # the has_secure_pwd includes a presence validation
  # but only applies to records with empty passwords
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  #Returns the hash digest of the given string
  def User.digest(string)
   # Line for cost parameters and password digests from the secure
   # password source code 
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
  end
end
