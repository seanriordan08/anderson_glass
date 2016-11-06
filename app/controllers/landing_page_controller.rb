class LandingPageController < ApplicationController

  def index
    set_section_content
    @current_user = current_user
    set_banner
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
