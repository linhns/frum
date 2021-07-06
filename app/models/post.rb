class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many :replies
end
