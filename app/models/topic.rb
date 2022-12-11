class Topic < ApplicationRecord
    belongs_to :section
    has_many :messages

    validates :title, presence: { message: "не может быть пустым" }
end
