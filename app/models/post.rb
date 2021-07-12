class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many :replies
  has_one_attached :image

  # validates :image, content_type: [:png, :jpg, :jpeg]

  def display_image
    image.variant(resize_to_limit: [920, 500])
  end
end
