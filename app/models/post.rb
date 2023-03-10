class Post < ApplicationRecord
    has_one_attached :image
    has_many :post_genres, dependent: :destroy
    has_many :genres, through: :post_genres, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :store_name,presence: true, length:{ in:1..50}
    # validates :post_code,presence: true, length:{ in:1..10}
    validates :address,presence: true, length:{ in:1..50}
    # validates :regular_holiday,presence: true, length:{ in:1..20}
    # validates :review,presence: true, length:{ in:1..100}
    validates :rate,presence: true
    
    def favorited?(user)
        favorite_users.include?(user)
    end
    
    def self.ransackable_attributes(auth_object = nil)
        ["address","store_name","user_id"]
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["comments", "favorites", "genres", "image_attachment", "image_blob", "post_genres", "user"]
    end
    
    validates :rate, numericality: {
        less_than_or_equal_to: 5,
        greater_than_or_equal_to: 1}, presence: true
end
