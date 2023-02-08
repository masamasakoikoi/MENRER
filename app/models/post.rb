class Post < ApplicationRecord
    has_one_attached :image
    has_many :favorite
    has_many :comment
    has_many :post_genres
    has_many :genres, through: :post_genres
    # belongs_to :post_genre
    belongs_to :user
end
