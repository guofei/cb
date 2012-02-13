class AddReplytoToComment < ActiveRecord::Migration
  def change
    add_column :comments, :replyto, :integer

  end
end
