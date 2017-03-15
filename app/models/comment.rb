class Comment < ApplicationRecord
  belongs_to :article

  scope :desc , -> { order("created_at desc") }

end
