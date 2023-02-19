class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates :post_comment, length:{ in: 1..50}
    validates :rate, numericality: {
        less_than_or_equal_to: 5,
        greater_than_or_equal_to: 1}, presence: true 
end
