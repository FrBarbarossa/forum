class Chapter < ApplicationRecord
    has_many :sections 

    validates :title, presence: { message: "не может быть пустым" }
end
    