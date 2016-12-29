class Comment < ApplicationRecord
    validates :comment_body, presence: true, length: { maximum: 300 }
    validates :user_id, presence: true
    validates :post_id, presence:true

    belongs_to :user
    has_one :post
end
