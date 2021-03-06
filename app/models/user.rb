class User < ApplicationRecord

  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :password, presence: true, confirmation: true

  has_many :fitness_goals
  has_many :blogs
  has_many :articles
  has_many :user_nutritions
  has_many :events

  has_many :event_users

  has_many :exercise_sessions




end
