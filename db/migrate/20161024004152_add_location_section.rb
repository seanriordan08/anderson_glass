class AddLocationSection < ActiveRecord::Migration
  LOCATION_CONTENT = <<-string
Anderson Glass services clients in towns across New Jersey such as Annandale, Bedminster, Berkeley Heights, Bernardsville, Chatham, Clinton, Far Hills, Flemington, Maplewood, Millburn, New Providence, Pittstown, Short Hills, Summit, Tewksbury, Westfield and surrounding towns.

Anderson Glass manufactures and fabricates in Hunterdon County, NJ and services Essex, Hunterdon, Morris, Union and Somerset county and surrounding townships.
string

  SectionContent.create(name: 'locations', html_content: LOCATION_CONTENT)
end
