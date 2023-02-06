class ChangeColumnsNotnullAddFavorites < ActiveRecord::Migration[6.1]
  def change
    change_column :favorites, :post_id, :string, null: false
    change_column :favorites, :user_id, :string, null: false
  end
end
