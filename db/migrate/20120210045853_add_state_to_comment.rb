class AddStateToComment < ActiveRecord::Migration
  def change
    add_column :comments, :state, :boolean

  end
end
