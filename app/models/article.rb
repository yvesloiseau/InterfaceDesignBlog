class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :article_title, presence: true,
                    length: { minimum: 5 }
	scope :desc , -> { order("created_at desc") }
end

