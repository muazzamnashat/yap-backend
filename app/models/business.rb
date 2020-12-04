class Business < ApplicationRecord
  default_scope { order created_at: :desc }
  has_many :reviews, dependent: :destroy
end
