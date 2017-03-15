class ChangeColumnNamesComments < ActiveRecord::Migration[5.0]
  def change
  	rename_column :comments, :commenter_email, :user_email
  	rename_column :comments, :commenter_imageorvideo, :user_imageorvideo
  	add_column :comments, :user_id, :integer
  	remove_column :comments, :posted_date
  end
end
