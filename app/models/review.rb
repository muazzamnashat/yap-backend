class Review < ApplicationRecord
  default_scope { order created_at: :desc }
  validates_presence_of :rating
  belongs_to :user
  belongs_to :business
  after_save :change_rating
  before_destroy :delete_rating

  private

  def change_rating
    current_rating = Business.find_by_id(self.business_id).rating
    total_reviews = Review.where("business_id = #{self.business_id}").size
    total = current_rating * (total_reviews - 1)
    updated_rating = (total + self.rating) / total_reviews
    Business.find_by_id(self.business_id).update(rating: updated_rating)
  end

  def delete_rating
    current_rating = Business.find_by_id(self.business_id).rating
    total_reviews = Review.where("business_id = #{self.business_id}").size
    total = current_rating * total_reviews
    updated_rating = (total - self.rating) / (total_reviews - 1)
    Business.find_by_id(self.business_id).update(rating: updated_rating)
  end
end
