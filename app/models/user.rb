class User < ApplicationRecord
  # Associations
  # A user has many posts
  # A user has many comments
  # A user has many likes
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # The 3 most recent posts for a user
  scope :recent_posts, ->(user) { user.posts.order('created_at desc').limit(3) }
end
