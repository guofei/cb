class ChangeDateTypeForProfile < ActiveRecord::Migration
  def up
    change_column(:profiles, :tel, :string)
  end

  def down
    change_column(:profiles, :tel, :integer)
  end
end
