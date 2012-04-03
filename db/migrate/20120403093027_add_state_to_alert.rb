class AddStateToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :state, :boolean

  end
end
