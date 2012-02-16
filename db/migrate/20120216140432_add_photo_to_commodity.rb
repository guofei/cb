class AddPhotoToCommodity < ActiveRecord::Migration
  def change
    add_column :commodities, :photo, :string

  end
end
