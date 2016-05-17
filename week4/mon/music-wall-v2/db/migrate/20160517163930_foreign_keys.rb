class ForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :users, :songs
  end
end
