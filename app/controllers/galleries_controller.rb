class GalleriesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.all
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
