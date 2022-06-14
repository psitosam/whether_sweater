Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :forecast, only: :index
      # resources :backgrounds, only: :index
      # resources :sessions, only: :create
      # resources :road_trip, only: :create
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'backgrounds#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end
  end
end
