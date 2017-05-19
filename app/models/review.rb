class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :score, :comment, :user, :book,  presence: true
  validates :comment, :user, :book, length: {minimum: 2, maximum: 255}
  validates :score inclusion => {:in => 1..5, :message => "rating must be between 1 and 5"}

end
