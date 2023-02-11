class Post < ApplicationRecord
    has_one_attached :image
    has_many :favorites
    has_many :post_genres, dependent: :destroy
    has_many :genres, through: :post_genres, dependent: :destroy
    has_many :favorites, dependent: :destroy
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    def favorited?(user)
        favorites.where(user_id: user.id).exists?
    end
    
    def self.ransackable_attributes(auth_object = nil)
        ["address","store_name","user_id"]
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["comments", "favorites", "genres", "image_attachment", "image_blob", "post_genres", "user"]
    end
end
