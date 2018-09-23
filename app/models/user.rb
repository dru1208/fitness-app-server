class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtBlacklist

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :password, presence: true, confirmation: true

  has_many :fitness_goals
  has_many :blogs
  has_many :user_nutritions
  has_many :events

  has_many :event_users

  has_many :exercise_sessions



  def jwt_payload
    {'reply' => 'youve made a successful request'}
  end

end
