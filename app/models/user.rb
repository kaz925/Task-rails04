class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  
  VALID_EMALL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i
  validates :email, presence: true,
  format: {with: VALID_EMALL_REGEX}

  has_secure_password
 
 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
　validates :password, presence: true,
　format: { with: VALID_PASSWORD_REGEX }
end
