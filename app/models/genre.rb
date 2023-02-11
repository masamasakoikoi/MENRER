class Genre < ApplicationRecord
    has_many :post_genres, dependent: :destroy
    has_many :posts, through: :posts_genres, dependent: :destroy
end
