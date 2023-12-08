# app/models/task.rb
class Task < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  # Add any other validations or associations you need
end
