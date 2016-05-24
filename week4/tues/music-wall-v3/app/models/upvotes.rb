class Upvotes < ActiveRecord::Base

  belongs_to :user, :song

end