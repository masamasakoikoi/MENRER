class Genre < ApplicationRecord
    has_many :post_genres, dependent: :destroy
    has_many :posts, through: :post_genres, dependent: :destroy
    
    validates :genre_name, presence: true
    
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "genre_name", "id", "updated_at"]
    end
end
