class AddTokenAndProviderToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string

    add_column :users, :provider, :string

  end
end
