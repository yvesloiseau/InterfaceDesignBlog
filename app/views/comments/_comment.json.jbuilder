json.extract! comment, :id, :posted_by, :article_comment, :article_id, :created_at, :updated_at, :user_id
json.url comment_url(comment, format: :json)
