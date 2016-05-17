class AddForeignKeys2 < ActiveRecord::Migration
  def change
    add_reference :users, :song, index: true
    add_foreign_key :users, :songs
  end


end
