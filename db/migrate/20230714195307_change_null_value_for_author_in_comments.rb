class ChangeNullValueForAuthorInComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :comments, :author_id, true
    change_column_null :comments, :post_id, true
  end
end
