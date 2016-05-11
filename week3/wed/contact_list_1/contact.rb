require 'csv'
require 'pry'
require 'pg'
require 'pp'
require 'active_record'

ActiveRecord::Base.establish_connection(
   adapter: 'postgresql',
   username: 'development',
   password: 'development',
   host: 'localhost',
   database: 'postgres'
   )

class Contact < ActiveRecord::Base

  def output
    "#{self.id}, #{self.name}, #{self.email}" 
  end

  
end