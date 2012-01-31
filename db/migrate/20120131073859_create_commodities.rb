class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name
      t.integer :num
      t.text :desc
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
