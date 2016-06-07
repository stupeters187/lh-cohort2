require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "generate dummy data for the app"
task "db:populate" do
  puts "Generating dummy data..."
  Contact.delete_all
  Contact.create!(first_name: 'Nina', last_name: 'Simone', email: 'nina@simone.com', phone_number: 2502502505)
  Contact.create!(first_name: 'Billie', last_name: 'Holiday', email: 'billie@holiday.com', phone_number: 2502502505)
  Contact.create!(first_name: 'Ella', last_name: 'Fitzgerald', email: 'ella@fitzgerald.com', phone_number: 2502502505)
  Contact.create!(first_name: 'Louis', last_name: 'Armstrong', email: 'louis@armstrong.com', phone_number: 2502502505)
end