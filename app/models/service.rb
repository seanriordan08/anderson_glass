class Service < ActiveRecord::Base

  def self.get_residential_services
    ['Frameless shower enclosures','Custom shower doors','Tub enclosures','Beveling','Tempered glass','Insulated glass','Table tops','Mirrors', 'Laminated glass']
  end

  def self.get_commercial_services
    ['Storefronts', 'Curtain walls', 'Automatic doors', 'Glass Entrances and doors', 'Custom glass walls', 'Total glass doors', 'Glass railings', 'Tempered glass', 'Aluminum panels']
  end

end
