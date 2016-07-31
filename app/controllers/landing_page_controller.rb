class LandingPageController < ApplicationController

  def index
    @residential_services = Service.get_service_descriptions('residential')
    @commercial_services = Service.get_service_descriptions('commercial')
  end
end
