class User < ApplicationRecord
  VALID_EMALL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: VALID_EMALL_REGEX }
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
