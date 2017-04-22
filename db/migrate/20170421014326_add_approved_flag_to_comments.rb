class AddApprovedFlagToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :approved, :boolean, default: false, null: false
  end
end
