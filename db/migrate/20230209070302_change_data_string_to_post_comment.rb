class ChangeDataStringToPostComment < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :post_comment, :text
  end
end
