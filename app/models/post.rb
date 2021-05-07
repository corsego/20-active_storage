class Post < ApplicationRecord
  validates :title, presence: true

  has_one_attached :avatar
  
  def to_s
    title
  end
end
