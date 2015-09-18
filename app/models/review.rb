class Review < ActiveRecord::Base
  belongs_to :book
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: "Must be between 1 and 5" }
  validates :body, presence: true
end
