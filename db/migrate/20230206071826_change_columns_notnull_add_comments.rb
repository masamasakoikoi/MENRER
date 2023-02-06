class ChangeColumnsNotnullAddComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :post_id, :integer, null: false
    change_column :comments, :user_id, :integer, null: false
    change_column :comments, :comment, :string, null: false
  end
end
