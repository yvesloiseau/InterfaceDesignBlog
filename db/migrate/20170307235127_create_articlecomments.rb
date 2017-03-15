class CreateArticlecomments < ActiveRecord::Migration[5.0]
  def change
    create_table :articlecomments do |t|
      t.integer :article_id
      t.text :comment
      t.string :posted_by
      t.string :email_address
      t.date :posted_date
    end
    add_index :articlecomments, :article_id
  end
end
