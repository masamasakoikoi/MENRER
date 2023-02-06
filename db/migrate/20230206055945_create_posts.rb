class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      # t.integer :id
      t.integer :user_id
      t.string :store_name
      t.string :post_code
      t.string :address
      t.string :regular_holiday
      t.string :review

      t.timestamps
    end
  end
end
