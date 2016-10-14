class GalleriesController < ApplicationController

  def index
    @pictures = Picture.all
  end

end
