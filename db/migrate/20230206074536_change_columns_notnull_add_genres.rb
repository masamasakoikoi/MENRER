class ChangeColumnsNotnullAddGenres < ActiveRecord::Migration[6.1]
  def change
    change_column :genres, :genre_name, :string, null: false
  end
end
