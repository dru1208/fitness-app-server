class UserNutrition < ApplicationRecord

  belongs_to :user

  after_initialize :init
  def init
    self.serving_size ||= 1
  end
end
