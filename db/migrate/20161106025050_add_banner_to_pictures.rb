class AddBannerToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :banner, :boolean, default: false
  end
end
