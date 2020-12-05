class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates_uniqueness_of :email
  # has_secure_password
end
