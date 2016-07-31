# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Add users
first_names = %w(jim bob tom sally)
last_names = %w(smith johnson reynolds shears)
raise "First names must all have last names!" unless (first_names.size == last_names.size)

first_names.each_with_index do |first_name, index|
  User.create_with(
    first_name: first_name,
    last_name: last_names[index],
    email: "#{first_name}@example.com",
    password: 'password'
  ).find_or_create_by!(email: "#{first_name}@example.com")
end

# Add services
residential_services = ['Frameless shower enclosures','Custom shower doors','Tub enclosures','Beveling','Tempered glass','Insulated glass','Table tops','Mirrors', 'Laminated glass']
commercial_services = ['Storefronts', 'Curtain walls', 'Automatic doors', 'Glass Entrances and doors', 'Custom glass walls', 'Total glass doors', 'Glass railings', 'Tempered glass', 'Aluminum panels']
residential_services.each do |s|
  Service.create_with(
    description: s,
    market_type: 'residential'
  ).find_or_create_by!(description: s)
end
commercial_services.each do |s|
  Service.create_with(
    description: s,
    market_type: 'commercial'
  ).find_or_create_by!(description: s)
end