class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates :post_comment, length:{ in: 1..100}
end
