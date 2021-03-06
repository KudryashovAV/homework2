class MoviesController < ApplicationController
  before_filter :authorize
  helper_method :ratings_params, :all_ratings, :sort_column, :sort_direction 

  def index
    session[:sort_by] = params[:sort_by] if params[:sort_by]
    session[:ratings] = params[:ratings] if params[:ratings]
    #@movies = Movie.where(rating: ratings_params.keys).order(session[:sort_by]+ ' ' + "#{params[:direction]}")
    @movies = Movie.list_for(current_user, rating: ratings_params.keys, order:(session[:sort_by] + " " + "#{params[:direction]}"))
  end

  def show
    @movie = find_movie 
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    @movie.user = current_user
    
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def edit
    @movie = find_movie
  end

  def update
    @movie = find_movie
    @movie.published = false
    @movie.attributes = movie_params
    if @movie.valid?
      unless @movie.published?
        Movie.create! Movie.find(@movie.id).attributes.except('id', 'created_at', 'updated_at')
      end
      @movie.save
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def publish
    @movie = find_movie
    @movie.update_column :published, true
    @movie_understudy = Movie.where('twin_id = ?', @movie.twin_id)
    @movie_understudy.order(:created_at).last.destroy if @movie_understudy.many?
    redirect_to @movie
  end

  def destroy
    @movie = find_movie
    @movie.destroy
    @movie.avatar = nil
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_url
  end

  private

  def find_movie
    Movie.find(params[:id])
  end

  def movie_params
    #params[:movie].permit(:title, :rating, :release_date, :description, :avatar, :published)
    fields = [:title, :rating, :release_date, :description, :avatar]
    fields += [:published] if current_user.admin?
    params.require(:movie).permit(fields)
  end

  def all_ratings
    @all_ratings ||= Movie.all_ratings
  end

  def ratings_params
    session[:ratings] || Hash[all_ratings.map {|x| [x, "1"]}]
  end

end
