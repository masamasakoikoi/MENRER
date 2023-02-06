class RemoveIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :id, :integer
  end
end
