class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end

  def create
    movie_params = params.require(:movie).permit(:title, :description)

    @movie = Movie.new(movie_params)

    if @the_movie.valid?
      @the_movie.save
      redirect_to movies_url, notice: "Created movie."
    else
      render "new"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    @movie = Movie.find(params.fetch(:id))
    movie_params = params.require(:movie).permit(:title, :description)

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Updated movie."
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))
    @movie.destroy
    
    redirect_to movies_url, notice: "Deleted movie."
  end
end
