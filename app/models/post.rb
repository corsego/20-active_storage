class Post < ApplicationRecord
  validates :title, presence: true

  has_one_attached :avatar
  has_many_attached :images

  validates :avatar, attached: true, dimension: { width: { min: 800, max: 2400 } },
    content_type: [:png, :jpg, :jpeg], size: { less_than: 100.kilobytes , message: 'is not given between size' }

  validates :images, attached: true, limit: { min: 1, max: 3 }, content_type: [:png, :jpg, :jpeg, :mp3]

  def to_s
    title
  end
end
