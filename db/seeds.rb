# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts ''

puts 'Creating User Admin...'
User.create! :name => "admin", :email => "admin@admin.com", :password => "inicial1234"

# puts 'Creating Mood...'
# Mood.find_or_create_by({:kind => "Alegre", :image_url => "71155072871"})
# Mood.find_or_create_by({:kind => "Animado", :image_url => "67770445230"})
# Mood.find_or_create_by({:kind => "Bem", :image_url => "40062472143"})
# 	