class Account < ApplicationRecord
    has_one_attached :avatar, service: :local
    belongs_to :user
    has_many :topics
    has_many :messages
    has_many :moderations
    has_many :likes

    validates :description, length: {
      maximum: 200, 
      message: "не может быть длиннее 200 символов"}

    validates :name, length: {
      maximum: 15,
      minimum: 4,
      too_long: "не может быть длиннее 15 символов",
      too_short: "не может быть короче 4 символов"
    }

    validate :avatar_validation

    def avatar_validation
      if avatar.attached?
        if avatar.blob.byte_size > 1000000
          errors.add(:avatar, 'слишком большой')
        elsif !avatar.blob.content_type.starts_with?('image/')
          errors.add(:avatar, 'может быть только png/jpeg')
        end
      end
    end

  end
  