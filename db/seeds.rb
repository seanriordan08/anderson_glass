# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Add users
first_names = %w(example jim bob tom sally)
last_names = %w(example_last_name smith johnson reynolds shears)
raise "First names must all have last names!" unless (first_names.size == last_names.size)

first_names.each_with_index do |first_name, index|
  User.create_with(
    first_name: first_name,
    last_name: last_names[index],
    email: "#{first_name}@example.com",
    password: 'password'
  ).find_or_create_by!(email: "#{first_name}@example.com")
end

User.find_or_create_by(first_name: 'Scarlett') do |user|
  user.last_name = 'Johansson'
end

SectionContent.find_or_create_by(name: 'projects') do |section|
  section.name = 'projects'
  section.html_content = "A growing number of architects, contractors and owners continue to rely on Anderson Glass' commercial glazing for the best in lead times, full compliance with architectural specifications, and quality products and installations that you will be proud of. At Anderson Glass, we are committed to Quality,&nbsp;Integrity, and Professionalism on every project, whether it be in your home or business location. Call us today at 908.735.8333."
  section.last_modified_by = nil
  section.last_modified_date = nil
end

SectionContent.find_or_create_by(name: 'locations') do |section|
  section.name = 'locations'
  section.html_content = "A growing number of architects, contractors and owners continue to rely on Anderson Glass' commercial glazing for the best in lead times, full compliance with architectural specifications, and quality products and installations that you will be proud of. At Anderson Glass, we are committed to Quality,&nbsp;Integrity, and Professionalism on every project, whether it be in your home or business location. Call us today at 908.735.8333."
  section.last_modified_by = nil
  section.last_modified_date = nil
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