class ChangeNullValueForAuthorInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :author_id, true
  end
end
