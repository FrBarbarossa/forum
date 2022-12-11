class Topic < ApplicationRecord
    belongs_to :section
    belongs_to :account
    has_many :messages

    validates :title, presence: { message: "не может быть пустым" }
end
