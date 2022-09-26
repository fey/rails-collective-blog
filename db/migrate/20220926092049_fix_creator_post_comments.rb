class FixCreatorPostComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :post_comments, :creator_id, :user_id
  end
end
