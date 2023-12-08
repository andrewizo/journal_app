# app/models/category.rb
class Category < ApplicationRecord
    validates :name, presence: true
    has_many :tasks, dependent: :destroy
end
  