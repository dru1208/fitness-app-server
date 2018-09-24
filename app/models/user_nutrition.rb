class UserNutrition < ApplicationRecord

  belongs_to :user
  after_initialize :init

  def init
    self.protein        ||= 0.0
    self.fat            ||= 0.0
    self.carbohydrates  ||= 0.0
    self.sugar          ||= 0.0
  end


end
