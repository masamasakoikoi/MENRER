class RenameFollwingIdColumnToUserRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_relationships, :follwing_id, :following_id
  end
end
