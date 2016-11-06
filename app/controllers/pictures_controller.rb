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
      render 'landing_page/index.haml'
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      set_banner
      render nothing: true
    end
  end


  private

  def update_banner(picture)
    Picture.where(banner: true).update_all(banner: false)
    picture.update(banner: true)
  end

  def picture_params
    params.require(:picture).permit(:image, :market)
  end
end
