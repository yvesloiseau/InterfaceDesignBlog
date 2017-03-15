class Articlecomments < ActiveRecord::Migration[5.0]
  def change
  	rename_column :comments, :aricle_comment, :article_comment
  end
end
