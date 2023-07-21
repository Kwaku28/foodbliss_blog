class Comment < ApplicationRecord
  # Associations
  # A comment belongs to an author
  # A comment belongs to a post
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  before_save :update_comments_counter
  after_destroy :reset_comments_counter

  # Updates the comments counter for a post
  def update_comments_counter
    Post.find_by(id: post_id).increment!(:comments_counter)
  end

  def reset_comments_counter
    Post.find_by(id: post_id).decrement!(:comments_counter)
  end
end
