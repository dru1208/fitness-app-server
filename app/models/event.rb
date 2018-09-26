class Event < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :datetime, presence: true

  belongs_to :user
end
