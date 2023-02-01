Rails.application.routes.draw do
  get "movies#index"

  # Routes for the Movie resource:

  resources :movies

  #------------------------------
end
