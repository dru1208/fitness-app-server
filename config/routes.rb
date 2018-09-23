Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api, defaults: {format: :json} do
    resources :events, only: [:index]
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
