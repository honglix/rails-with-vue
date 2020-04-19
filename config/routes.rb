Rails.application.routes.draw do

  root to: 'application#index'

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  match "*path", to: "application#index", format: false, via: :get
end
