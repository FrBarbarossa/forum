class User < ApplicationRecord
    include ActiveModel::SecurePassword
    extend ActiveModel::Translation
    has_secure_password
    has_one :account
    

    validates :login, presence: {message: "не может быть пустым"}, uniqueness: { message: "Пользователь с таким именем уже существует"}
    validates :email, email: { message: "неверный формат" }

  end
  