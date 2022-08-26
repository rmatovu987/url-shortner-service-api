Rails.application.routes.draw do

  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  get 'home/index'
  get 'home/send_to_url'
  resources :urls, only: %i[index new create]

  scope :api, defaults: { format: :json } do
    devise_for :users,
               controllers: { sessions: :sessions },
               path_names: { sign_in: :login }

    devise_scope :user do
      post '/users/sign_up' => 'devise/registrations#create'
    end

    resource :user, only: %i[show update]
  end

  root 'home#index'

  get '/app/:short_url', to: 'home#send_to_url'
end
