class Task < ApplicationRecord
  belongs_to :category

  validates :title, presence: true

  # Use all_day to cover the entire day for tasks due today
  scope :due_today, -> { where("due_date = ?", Time.current.in_time_zone.beginning_of_day.to_date) }
end
