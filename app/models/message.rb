class Message < ApplicationRecord
    has_rich_text :content
    belongs_to :account
    belongs_to :topic
    has_many :likes

    validates :content, presence: { message: "не может быть пустым" }
    validates :status, inclusion: { in: %w(visible hidden deleted), message: "Некорректный статус" }
end
