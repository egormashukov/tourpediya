class CitiesController < ApplicationController

  def index
    load_cities
  end

  def new
    build_city
  end

  def show
    load_city
    load_excursions
  end

  def create
    build_city
    save_city || render(:new)
  end

  def edit
    load_city
    build_city
  end

  def update
    load_city
    build_city
    save_city || render(:edit)
  end

  def destroy
    load_city
    destroy_city
    redirect_to :cities
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

  def build_city
    @city ||= city_scope.build
    @city.attributes = city_params
  end

  def save_city
    @city.save
  end

  def destroy_city
    @city.destroy
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
