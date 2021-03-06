class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_section_content
    @residential_services = Service.get_service_descriptions('residential')
    @commercial_services = Service.get_service_descriptions('commercial')

    @projects_contents = SectionContent.where(name: 'projects').first
    @locations_contents = SectionContent.where(name: 'locations').first
  end

  def set_banner
    @banner = Picture.where(banner: true).first
  end

  def set_project
    @project = Picture.where(project: true).first
  end

  def set_featured
    @featured_residential = Picture.where(featured: true).where(market: 'residential').first
    @featured_commercial = Picture.where(featured: true).where(market: 'commercial').first
  end

end
