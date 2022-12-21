class Section < ApplicationRecord
  has_many :topics
  has_many :moderations
  belongs_to :chapter

  validates :title, presence: { message: "не может быть пустым" }
  validates :status, presence: { message: "не может отсутствовать" }, inclusion: { in: %w(opened hidden deleted), 
    message: "Некорректный статус" }
end
  