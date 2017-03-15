class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :article_title
      t.text :article_text
      t.string :posted_by
      t.date :posted_date
      t.string :article_image
      t.string :article_video
      t.string :article_details

      t.timestamps
    end
  end
end
