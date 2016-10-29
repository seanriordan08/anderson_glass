class AddMarketToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :market, :string, null: false
  end

  # Picture.find_each{ |p| p.delete if p.market.blank? }
end
