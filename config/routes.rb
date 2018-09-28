Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api, defaults: {format: :json} do

    post '/login', to: 'sessions#create'

    post '/register', to: 'users#create'

    resources :exercise_sessions, only: [:create, :index]

    resources :fitness_goals, only: [:create, :destroy, :index]

    resources :user_nutritions, only: [:create, :index]

    resources :event_maps, only: [:index]

    resources :gym_maps, only: [:index]

    resources :events, only: [:create, :destroy, :index]

    resources :event_users, only: [:create, :destroy, :index]

    resources :blogs, only: [:create, :destroy, :index]

    resources :articles, only: [:create, :destroy, :index]

    resources :feeds, only: [:index]

    resources :image_recognition, only: [:create]

    resources :nutrition_search, only: [:create]

    resources :dashboard_nutritions, only: [:index]

  end
end





