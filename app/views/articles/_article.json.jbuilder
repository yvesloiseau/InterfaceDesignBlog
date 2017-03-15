json.extract! article, :id, :article_title, :article_text, :posted_by, :posted_date, :article_image, :article_video, :article_details, :created_at, :updated_at
json.url article_url(article, format: :json)
