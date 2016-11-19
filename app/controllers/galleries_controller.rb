class GalleriesController < ApplicationController
  before_action :authenticate_user!, :only => [:destroy]

  def index
    @pictures = Picture.where(banner: false).where(project: false)
  end

  def show_residential
    @pictures = Picture.where(market: 'residential', banner: false)
    binding.pry
  end

  def show_commercial
    @pictures = Picture.where(market: 'commercial', banner: false)
  end

  def destroy
    @picture = Picture.where(id: params[:id]).first

    if current_user.role == 'admin'
      @picture.image.destroy
      @picture.image.clear
      @picture.destroy
    end

    respond_to do |format|
      format.js { render status: 200, locals: { destroyed_id: params[:id] } }
    end
  end
end
