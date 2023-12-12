class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :categories
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  end