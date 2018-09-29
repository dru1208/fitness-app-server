class UserNutrition < ApplicationRecord

  belongs_to :user

  after_initialize :init
  def init
    if !self.serving_size
      self.serving_size = 1
    end
  end
end
