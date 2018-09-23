Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :fitness_goals, only: [:index, :create, :update, :destroy]

  resources :weekly_activities, only: [:index, :create]

  resources :user_nutrition, only: [:index]

  resources :events, only: [:index]

  resources :feed, only: [:index]

  resources :map, only: [:index]

  resources :nutrition, only: [:create]

  resources :blogs, only: [:index, :create, :destroy]

  resources :events, only: [:index, :create, :destroy]

end





