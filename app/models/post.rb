class Post < ApplicationRecord
  # Associations
  # A post belongs to an author
  # A post has many comments
  # A post has many likes
  belongs_to :author, class_name: 'User' foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
end