Rails.application.routes.draw do
  root "movies#index"

  # Routes for the Movie resource:

  resources :movies

end
