class RestaurantSearchesController < ApplicationController
  def show
    @restaurant_search = RestaurantSearch.new(restaurant_search_params_b)
    @results = results
  end

  def create
    @restaurant_search = RestaurantSearch.new(restaurant_search_params)
    render json: results
  end

  private

  def restaurant_search_params_b
    params.permit(:query, :location)
  end

  def restaurant_search_params
    params.require(:restaurant_search).permit(:query, :location, :offset)
  end

  def results
    @restaurant_search.results
  end
end
