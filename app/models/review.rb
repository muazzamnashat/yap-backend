class Review < ApplicationRecord
  default_scope { order created_at: :desc }
  validates_presence_of :rating
  belongs_to :user
  belongs_to :business
end
