class User < ActiveRecord::Base

  has_many :songs 
  has_many :upvotes

  validates :username, :password, :email, presence: true


end