class User < ApplicationRecord
  has_many :characters
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_secure_password

end
