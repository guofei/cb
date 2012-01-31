class CreateCommodityCates < ActiveRecord::Migration
  def change
    create_table :commodity_cates do |t|
      t.references :commodity
      t.references :category

      t.timestamps
    end
  end
end
