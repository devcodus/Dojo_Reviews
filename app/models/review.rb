class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :score, :comment, :user, :book,  presence: true
  validates :comment, :user, :book, length: {minimum: 2, maximum: 255}

end
