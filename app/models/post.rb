class Post < ApplicationRecord
  validates :title, presence: true
  
  def to_s
    title
  end
end
