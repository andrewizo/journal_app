# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :tasks
  has_many :categories
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Add the time_zone attribute
  validates :time_zone, presence: true

  before_validation :set_default_time_zone, on: :create

  private

  def set_default_time_zone
    self.time_zone ||= 'UTC' 
  end
end
