class Post < ApplicationRecord
  # Associations
  # A post belongs to an author
  # A post has many comments
  # A post has many likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  # The 3 most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_comments_counter

  after_save :update_likes_counter

  # Updates the comments counter for a post
  def update_comments_counter
    update(comments_counter: comments.count)
  end

  # Updates the likes counter for a post
  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
