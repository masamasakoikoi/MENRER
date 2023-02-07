class PostGenre < ApplicationRecord
    has_many :post
    has_many :genre
end
