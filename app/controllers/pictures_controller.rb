class PicturesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @pictures = Picture.where(banner: false).where(project: false).where(featured: false)
    render galleries_index_path
  end

  def create
    @picture = Picture.new( picture_params )

    if @picture.save
      flash[:success] = 'Image Added'
      setup_images({content:false, banner:false, project:false, featured: false})
      redirect_to action: 'index'
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      setup_images({content:false, banner:false, project:false, featured: false})
      redirect_to action: 'index'
    end
  end

  def create_banner
    @picture = Picture.new( picture_params )

    if @picture.save
      update_banner(@picture)
      flash[:success] = 'Banner Image Updated'
      setup_images({content:true, banner:true, project:true, featured: true})
      redirect_to root_path
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      setup_images({content:false, banner:true, project:true, featured: true})
      render nothing: true
    end
  end

  def create_project
    @picture = Picture.new( picture_params )

    if @picture.save
      update_project(@picture)
      flash[:success] = 'Project Image Updated'
      setup_images({content:true, banner:true, project:true, featured: true})
      redirect_to root_path
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      setup_images({content:false, banner:true, project:true, featured: true})
      render nothing: true
    end
  end

  def create_featured
    @picture = Picture.new( picture_params )

    if @picture.save
      update_featured(@picture)
      flash[:success] = 'Project Image Updated'
      setup_images({content:true, banner:true, project:true, featured: true})
      redirect_to root_path
    else
      flash[:error] = @picture.errors.messages.values.flatten.first
      setup_images({content:false, banner:true, project:true, featured: true})
      render nothing: true
    end
  end


  private

  def picture_params
    params.require(:picture).permit(:image, :market, :banner)
  end

  def setup_images(options)
    set_section_content if options[:content]
    set_banner if options[:banner]
    set_project if options[:project]
    set_featured if options[:featured]
  end

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

  def update_featured(picture)
    if params[:picture][:market] == 'residential'
      old_featured_residential_id = Picture.where(featured: true).where(market: 'residential').first.id
      Picture.destroy(old_featured_residential_id)
    else
      old_featured_commercial_id = Picture.where(featured: true).where(market: 'commercial').first.id
      Picture.destroy(old_featured_commercial_id)
    end

    picture.update(featured: true)
  end

end
