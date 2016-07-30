# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = %w(jim bob tom sally)

users.each do |u|
  User.create_with(
    email: "#{u}@example.com",
    password: 'password'
  ).find_or_create_by!(email: "#{u}@example.com")
end