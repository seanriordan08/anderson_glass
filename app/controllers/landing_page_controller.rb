class LandingPageController < ApplicationController

  def index
    @residential_services = Service.get_service_descriptions('residential')
    @commercial_services = Service.get_service_descriptions('commercial')

    @craftsmanship_contents = SectionContent.where(name: 'craftsmanship').first
    @locations_contents = SectionContent.where(name: 'locations').first
  end

  def save_html_content
    params[:section_name].downcase!
    section_content = SectionContent.where(name: params[:section_name]).first
    section_content.save_html_content(current_user, params[:html_content])

    respond_to do |format|
      format.js { render "save_html_content" }
    end
  end
end
