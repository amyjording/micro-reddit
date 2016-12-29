class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 50 }

  has_many :posts 
end
