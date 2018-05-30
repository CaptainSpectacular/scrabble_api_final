Rails.application.routes.draw do
  root "welcome#index"
  get '/inflection', to: 'inflections#show'
end
