class Post < ApplicationRecord
  validates :title, presence: true

  has_one_attached :avatar
  has_many_attached :images

  def to_s
    title
  end
end
