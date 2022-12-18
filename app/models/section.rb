class Section < ApplicationRecord
  has_many :topics
  has_many :moderations
  belongs_to :chapter
end
  