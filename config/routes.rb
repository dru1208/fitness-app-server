Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :api, defaults: {format: :json} do
    resources :exercise_sessions, only: [:create, :index]

    resources :fitness_goals, only: [:create, :destroy, :index]

    resources :user_nutritions, only: [:create, :index]

    resources :maps, only: [:index]

    resources :events, only: [:create, :destroy, :index]

    resources :event_users, only: [:create, :destroy, :index]

    resources :blogs, only: [:create, :destroy, :index]

    resources :articles, only: [:create, :destroy, :index]

    resources :image_recognition, only: [:create]

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
                }
  end

end
