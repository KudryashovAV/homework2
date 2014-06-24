class WelcomeController < ApplicationController
  def show
    @sample_movie = Movie.order("RANDOM()").where(published: true).first
  end
end
