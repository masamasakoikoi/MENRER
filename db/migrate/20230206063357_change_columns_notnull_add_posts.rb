class ChangeColumnsNotnullAddPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :user_id, :integer, null: false
    change_column :posts, :store_name, :string, null: false
    change_column :posts, :post_code, :string, null: false
    change_column :posts, :address, :string, null: false
    change_column :posts, :regular_holiday, :string, null: false
    change_column :posts, :review, :string, null: false
  end
end
