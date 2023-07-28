class Post < ApplicationRecord
  # Associations
  # A post belongs to an author
  # A post has many comments
  # A post has many likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id

  before_save :update_posts_counter
  after_destroy :reset_posts_counter

  # The 3 most recent comments for a given post
  scope :recent_comments, ->(post) { post.comments.order(created_at: :desc).limit(5) }

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Updates the posts counter for a user
  def update_posts_counter
    User.find_by(id: author.id).increment!(:posts_counter)
  end

  def reset_posts_counter
    User.find_by(id: author.id).decrement!(:posts_counter)
  end
end
