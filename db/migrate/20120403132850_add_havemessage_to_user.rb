class AddHavemessageToUser < ActiveRecord::Migration
  def change
    add_column :users, :havemessage, :boolean

  end
end
