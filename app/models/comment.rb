class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates :post_comment, presence: true,length:{maximum:140}
end
