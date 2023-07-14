class ChangeNullValueForAuthorInLikes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :likes, :author_id, true
    change_column_null :likes, :post_id, true
  end
end
