class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.search(params[:search_title]) if params[:search_title]
    @movies = @movies.search(params[:search_dir]) if params[:search_dir]
    @movies = @movies.search_duration(params[:search_duration]) if params[:search_duration]
    @movies = @movies.page(params[:page]).per(5)
  end


  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id]) 

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def search
    @movies = Movie.search(params[:search])
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
      )
  end
end
