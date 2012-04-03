class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :commodity
      t.references :user
      t.string :info

      t.timestamps
    end
    add_index :alerts, :commodity_id
    add_index :alerts, :user_id
  end
end
