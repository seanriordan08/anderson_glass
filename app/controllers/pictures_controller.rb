class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.where(banner: false)
    render galleries_index_path
  end

  def create
    @picture = Picture.new( picture_params )

    if @picture.save
      flash[:success] = 'Image Added'
      set_section_content
      set_banner
      redirect_to action: 'index'
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      set_section_content
      set_banner
      set_project
      redirect_to action: 'index'
    end
  end

  def create_banner
    @picture = Picture.new( picture_params )

    if @picture.save
      update_banner(@picture)
      flash[:success] = 'Banner Updated'
      set_section_content
      set_banner
      set_project
      redirect_to root_path
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      set_banner
      set_project
      render nothing: true
    end
  end

  def create_project
    @picture = Picture.new( picture_params )

    if @picture.save
      update_project(@picture)
      flash[:success] = 'Banner Updated'
      set_section_content
      set_banner
      set_project
      redirect_to root_path
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      set_banner
      set_project
      render nothing: true
    end
  end


  private

  def update_banner(picture)
    old_banner_id = Picture.where(banner: true).first.id
    Picture.destroy(old_banner_id)

    picture.update(banner: true)
  end

  def update_project(picture)
    old_project_id = Picture.where(project: true).first.id
    Picture.destroy(old_project_id)

    picture.update(project: true)
  end

  def picture_params
    params.require(:picture).permit(:image, :market, :banner)
  end
end
