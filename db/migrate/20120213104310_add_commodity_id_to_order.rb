class AddCommodityIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :commodity_id, :integer

  end
end
