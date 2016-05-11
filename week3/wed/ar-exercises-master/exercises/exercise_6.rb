require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Stu", last_name: "Peters", hourly_rate: 100)
@store1.employees.create(first_name: "Kate", last_name: "Sage", hourly_rate: 1000)
@store2.employees.create(first_name: "Jon", last_name: "Hagerty", hourly_rate: 50)
@store2.employees.create(first_name: "Ray", last_name: "Siddiqui", hourly_rate: 10)
