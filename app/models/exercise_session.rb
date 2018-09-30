class ExerciseSession < ApplicationRecord

  validates :datetime, presence: true
  validates :minutes, presence: true

  belongs_to :user

  after_initialize :init
  def init
    self.week_of ||= Date.current.beginning_of_week(start_day = :sunday).to_s if self.has_attribute? :week_of
  end
end
