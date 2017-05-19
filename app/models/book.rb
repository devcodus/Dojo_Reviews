class Book < ActiveRecord::Base

  belongs_to :author
  has_many :reviews

  validates :title, :author presence: true
  validates :title, length: {minimum: 2, maximum: 255}
  validates :title, uniqueness: true
end
