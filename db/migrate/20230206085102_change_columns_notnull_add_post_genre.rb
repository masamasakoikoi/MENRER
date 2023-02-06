class ChangeColumnsNotnullAddPostGenre < ActiveRecord::Migration[6.1]
  def up
    change_column :post_genres, :post_id, :integer, null: false
    change_column :post_genres, :genre_id, :integer, null: false
  end
end
