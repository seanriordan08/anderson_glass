class AddFeaturedToPhotos < ActiveRecord::Migration
  def change
    add_column :pictures, :featured, :boolean, default: false
  end

  Picture.reset_column_information
  # Add featured pictures for each market
  @residential_picture = Picture.where(market: 'residential').first
  @residential_picture.update(featured: true) if @residential_picture.present?

  @commercial_picture = Picture.where(market: 'commercial').first
  @commercial_picture.update(featured: true) if @commercial_picture.present?
end
