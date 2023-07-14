class User < ApplicationRecord
  # Associations
  # A user has many posts
  # A user has many comments
  # A user has many likes
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  after_save :update_posts_counter

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # The 3 most recent posts for a user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Updates the posts counter for a user
  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
