class ExerciseSession < ApplicationRecord

  validates :datetime, presence: true
  validates :minutes, presence: true

  belongs_to :user
end
