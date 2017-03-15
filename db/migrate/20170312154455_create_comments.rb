class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :posted_by
      t.datetime :posted_date
      t.string :aricle_comment
      t.string :commenter_email
      t.string :commenter_imageorvideo
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
