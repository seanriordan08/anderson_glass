class Service < ActiveRecord::Base

  def self.get_service_descriptions(market_type)
    service_descriptions = []
    Service.where(market_type: market_type).find_each do |service|
      service_descriptions << service.description
    end
    service_descriptions
  end

end
