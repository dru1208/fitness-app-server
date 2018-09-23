Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :api, defaults: {format: :json} do
    resources :exercise_sessions, only: [:create, :index]
  end

  scope :api, defaults: {format: :json} do
    resources :fitness_goals, only: [:create, :destroy, :index]
  end

  scope :api, defaults: {format: :json} do
    resources :user_nutritions, only: [:create, :index]
  end

  scope :api, defaults: {format: :json} do
    resources :maps, only: [:index]
  end

  scope :api, defaults: {format: :json} do
    resources :events, only: [:create, :destroy, :index]
  end

  scope :api, defaults: {format: :json} do
    resources :event_users, only: [:create, :destroy, :index]
  end

  scope :api, defaults: {format: :json} do
    resources :blogs, only: [:create, :destroy, :index]
  end

  scope :api, defaults: {format: :json} do
    resources :articles, only: [:create, :destroy, :index]
  end





  ### do routes for each thing
  devise_for  :users,
              path: '',
              path_names: {
                sign_in: '/login',
                sign_out: '/logout',
                registration: '/register'
              },
              controllers: {
                sessions: 'sessions',
                registrations: 'registrations'
              },
              defaults: { format: :json }

end
