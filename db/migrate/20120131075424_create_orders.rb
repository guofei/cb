class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :name
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
