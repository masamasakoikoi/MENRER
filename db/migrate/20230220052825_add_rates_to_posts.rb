class AddRatesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :rate, :float, null: false, default: 0
  end
end
