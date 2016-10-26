class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all
    render galleries_index_path
  end

  def create
    @picture = Picture.new( picture_params )

    if @picture.save
      flash[:success] = 'Image Added'
      redirect_to action: 'index'
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      redirect_to action: 'index'
    end

  end


  private

  def picture_params
    params.require(:picture).permit(:image, :market)
  end
end
