class CitiesController < ApplicationController

  def index
    load_cities
  end

  def show
    load_city
    load_excursions
  end

  private

  def load_cities
    @cities ||= city_scope.joins(:index_excursions).includes(:index_excursions)
  end

  def load_city
    @city ||= city_scope.find(params[:id])
  end

  def load_excursions
    @excursions = @city.excursions.includes(:categories)
  end

  def city_scope
    City.all
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
