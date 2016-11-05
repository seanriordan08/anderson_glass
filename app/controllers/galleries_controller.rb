class GalleriesController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def index
    @pictures = Picture.all
  end

  def show_residential
    @pictures = Picture.where(market: 'residential')
  end

  def show_commercial
    @pictures = Picture.where(market: 'commercial')
  end

  def destroy
    @picture = Picture.where(id: params[:id]).first

    @picture.image.destroy
    @picture.image.clear
    @picture.destroy

    respond_to do |format|
      format.js { render status: 200, locals: { destroyed_id: params[:id] } }
    end
  end
end
