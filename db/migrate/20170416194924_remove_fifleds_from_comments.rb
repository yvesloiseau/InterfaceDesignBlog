class RemoveFifledsFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :user_email
  end
end
