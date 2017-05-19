class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :username, :email, presence: true
  validates :name, :username, :email, length: {minimum: 2, maximum: 255}
  validates_format_of :email, :with =>   EMAIL_REGEX, :on => :create
  validates :username, :email, uniqueness: true

end
