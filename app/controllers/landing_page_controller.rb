class LandingPageController < ApplicationController

  def index
    @residential_services = Service.get_service_descriptions('residential')
    @commercial_services = Service.get_service_descriptions('commercial')

    @craftsmanship_contents = SectionContent.where(name: 'craftsmanship').first
  end

  def save_html_content
    section_content = SectionContent.where(name: params[:section_name]).first
    section_content.save_html_content(current_user, params[:html_content])

    render status: 200
  end
end
