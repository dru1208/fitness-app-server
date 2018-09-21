class Event < ApplicationRecord

  validates :name, presence: true
  validates :location, presence: true
  validates :datetime, presence: true

  belongs_to :user
  has_many :event_users

end
