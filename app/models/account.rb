class Account < ApplicationRecord
    has_one_attached :avatar, service: :local
    belongs_to :user
  end
  