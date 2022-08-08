Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecast#index"
      post '/users', to: "users#create"
      post '/sessions', to: "sessions#index"
      post '/roadtrip', to: "road_trip#index"
      get '/munchies', to: "munchies#index"
    end
  end
end
