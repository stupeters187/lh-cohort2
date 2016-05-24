class Song < ActiveRecord::Base

  has_many :upvotes
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :artist, presence: true
  validates :url, presence: true

end