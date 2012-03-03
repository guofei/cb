class AddPlaceToCommodity < ActiveRecord::Migration
  def change
    add_column :commodities, :place, :string

  end
end
