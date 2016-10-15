class GalleriesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def destroy
    # binding.pry
    @picture = Picture.where(id: params[:id]).first

    @picture.image.destroy
    @picture.image.clear
    @picture.destroy

    respond_to do |format|
      format.js { render status: 200, locals: { destroyed_id: params[:id] } }
    end
  end
end
