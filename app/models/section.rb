class Section < ApplicationRecord
  has_many :topics
  has_many :moderations
end
  