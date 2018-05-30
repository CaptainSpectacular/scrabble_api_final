Rails.application.routes.draw do
  root "welcome#index"
  get '/inflection', to: 'inflections#show'


  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
end
