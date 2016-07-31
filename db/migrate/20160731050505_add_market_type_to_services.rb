class AddMarketTypeToServices < ActiveRecord::Migration
  def change
    add_column :services, :market_type, :string
  end
end
