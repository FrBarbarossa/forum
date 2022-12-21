class Like < ApplicationRecord
    belongs_to :account
    belongs_to :message

    validates :account_id, uniqueness: {scope: :message_id,
        message: "уже существует" }
end
