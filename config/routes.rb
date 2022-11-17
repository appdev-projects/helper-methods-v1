Rails.application.routes.draw do
  # get("/", { :controller => "movies", :action => "index" })
  # get"/", controller: "movies", action: "index"
  # get "/" => "movies#index"

  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies",  controller: "movies", action: "create", as: :movies # movies_url and movies_path
  get "/movies/new", controller: "movies", action: "new", as: :new_movie #new_movie_url and new_movie_path
          
  # READ
  get "/movies", controller: "movies", action: "index" 
  get "/movies/:id", controller: "movies", action: "show", as: :movie #traditionally named singular, movie_path() (expects an argument to populate :id segment)
  
  # UPDATE
  patch "/movies/:id", controller: "movies", action:  "update" 
  get "/movies/:id/edit", controller: "movies", action:  "edit", as: :edit_movie #edit_movie() (expects an argument to populate :id segment) 
  
  # DELETE
  delete "/movies/:id", controller: "movies", action: "destroy"

  #------------------------------
end
