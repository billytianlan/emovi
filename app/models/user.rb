class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :username, uniqueness: true

  has_many :comments
  has_many :guesses

end
