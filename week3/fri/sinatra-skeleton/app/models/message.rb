class Message < ActiveRecord::Base

  validates :url, presence: true
  validates :author, presence: true
  validates :content, presence: true

end