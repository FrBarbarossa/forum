class Account < ApplicationRecord
    has_one_attached :avatar, service: :local
    belongs_to :user

    validates :description, length: {
      maximum: 200, 
      message: "не может быть длиннее 200 символов"}
  end
  