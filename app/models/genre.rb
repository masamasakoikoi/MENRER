class Genre < ApplicationRecord
    has_many :post_genres
    has_many :posts, through: :posts_genres
end
