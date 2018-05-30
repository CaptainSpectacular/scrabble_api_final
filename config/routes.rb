Rails.application.routes.draw do
  root "welcome#index"
  get '/inflection', to: 'inflections#show'


  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]

      namespace :games do
        post ':game_id/plays', to: 'plays#create'
      end
    end
  end
end
