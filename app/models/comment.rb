class Comment < ApplicationRecord
  # Associations
  # A comment belongs to an author
  # A comment belongs to a post
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
end
