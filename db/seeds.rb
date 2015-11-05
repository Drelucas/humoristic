# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts ''

puts 'Creating Users...'
User.create! :name => "admin", :email => "admin@admin.com", :password => "inicial1234"
User.create! :name => "teste", :email => "teste@teste.com", :password => "inicial1234"
User.create! :name => "teste1", :email => "teste1@teste.com", :password => "inicial1234"
User.create! :name => "teste2", :email => "teste2@teste.com", :password => "inicial1234"
User.create! :name => "teste3", :email => "teste3@teste.com", :password => "inicial1234"
User.create! :name => "teste4", :email => "teste4@teste.com", :password => "inicial1234"
User.create! :name => "teste5", :email => "teste5@teste.com", :password => "inicial1234"
