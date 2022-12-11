class Message < ApplicationRecord
    has_rich_text :content
    belongs_to :account
    belongs_to :topic

    validates :content, presence: { message: "не может быть пустым" }
end
