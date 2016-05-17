class ChangeUpvotes < ActiveRecord::Migration
  def change
    change_table :upvotes do |t|
      t.remove :upvotes
    end

    change_table :upvotes do |t|
      t.integer :song_id
    end
  end
end
