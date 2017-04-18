class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

 # Validations
  validates :article_comment, presence: true,
                          length: { minimum: 5 }
  #validates :posted_by, presence: true
  #validates :user, presence: true

  # Scopes
  scope :desc , -> { order("created_at desc") }

end
