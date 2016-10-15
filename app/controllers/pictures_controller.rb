class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all
    render galleries_index_path
  end

  def create
    @picture = Picture.create( picture_params )
    redirect_to action: 'index'
  end


  private

  def picture_params
    params.require(:picture).permit(:image, :name)
  end
end
