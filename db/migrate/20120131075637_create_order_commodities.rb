class CreateOrderCommodities < ActiveRecord::Migration
  def change
    create_table :order_commodities do |t|
      t.references :order
      t.references :commodity

      t.timestamps
    end
    add_index :order_commodities, :order_id
    add_index :order_commodities, :commodity_id
  end
end
