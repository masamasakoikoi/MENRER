class Post < ApplicationRecord
    has_one_attached :image
    has_many :favorites
    has_many :post_genres
    has_many :genres, through: :post_genres
    has_many :favorites, dependent: :destroy
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    def favorited?(user)
        favorites.where(user_id: user.id).exists?
    end
end
