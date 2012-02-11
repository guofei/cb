class AddStateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :state, :boolean

  end
end
