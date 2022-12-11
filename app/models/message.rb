class Message < ApplicationRecord
    has_rich_text :content
    belongs_to :account

    validates :content, presence: { message: "не может быть пустым" }
end
