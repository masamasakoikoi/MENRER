class Post < ApplicationRecord
    has_one_attached :image
    has_many :favorite
    has_many :comment
    has_many :post_genres
    has_many :genres, through: :post_genres
    has_many :favorites, dependent: :destroy
    belongs_to :user
    
    def favorited?(user)
        favorites.where(user_id: user.id).exists?
    end
end
