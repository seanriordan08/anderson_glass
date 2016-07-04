class LandingPageController < ApplicationController

  def index
    @residential_services = Service.get_residential_services
    @commercial_services = Service.get_commercial_services
  end
end
