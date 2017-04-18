class RemoveFieldsFromCommentsSchema < ActiveRecord::Migration[5.0]
  def change
        remove_column :comments, :posted_by
  end
end
