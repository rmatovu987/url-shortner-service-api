Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users,
               controllers: { sessions: :sessions },
               path_names: { sign_in: :login }

    # devise_for :users
    devise_scope :user do
      # delete '/users/sign_out' => 'devise/sessions#destroy'
      post '/users/sign_up' => 'devise/registrations#create'
    end

    resource :user, only: %i[show update]
  end

  # root "articles#index"
end
