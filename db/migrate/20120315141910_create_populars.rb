class CreatePopulars < ActiveRecord::Migration
  def change
    create_table :populars do |t|
      t.references :commodity

      t.timestamps
    end
    add_index :populars, :commodity_id
  end
end
