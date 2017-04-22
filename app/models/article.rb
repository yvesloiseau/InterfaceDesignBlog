class Article < ApplicationRecord
  has_many :user
  has_many :comments, dependent: :destroy

 # Validations
  #validates :user, presence: true
  validates :article_title, presence: true,
                    length: { minimum: 5 }
  validates :article_text, presence: true,
                    length: { minimum: 5 }
  validates :posted_by, presence: true

  # Scopes
	scope :desc , -> { order("created_at desc") }

  # Methods
  def most_recent_comment
    comments.desc.first
  end

  #  Searches
  def self.search(search_term)
    if Rails.env.development?
      Article.where("article_title LIKE ?", "%#{search_term}%")

    else
      Article.where("article_title ilike ?", "%#{search_term}%")
    end
  end

end

