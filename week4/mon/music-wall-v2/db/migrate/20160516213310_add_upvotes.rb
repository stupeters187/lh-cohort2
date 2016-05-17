class AddUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.string :user_id
      t.integer :upvotes
    end
  end
end
