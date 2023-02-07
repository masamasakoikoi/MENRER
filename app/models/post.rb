class Post < ApplicationRecord
    has_one_attached :image
    has_many :favorite
    has_many :comment
    belongs_to :post_genre
    belongs_to :user
end
