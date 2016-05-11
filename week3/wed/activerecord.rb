require 'active_record'
require 'pry'
require 'sqlite3'

ActiveRecord::Base.logger = 
Logger.new(File.open('database.log', 'w'))

ActiveRecord::Base.establish_connection(
  adapter: 'splite3'
  database: ':memory:'
)


ActiveRecord::Schema.define do

  create_table :shows, force: true do |t|
    t.string :name
    t.timestamps
  end

  create_table :episodes, force: true do |t|
    t.string :name
    t.belongs_to :show
    t.timestamps
  end
end

class Show < ActiveRecord::Base
  has_many :episodes
end

class Episode < ActiveRecord::Base
  belongs_to :show, required: true
end
  
