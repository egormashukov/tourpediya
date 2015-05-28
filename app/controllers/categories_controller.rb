class CategoriesController < ApplicationController

  def show
    load_category
    load_excursions
  end

  private

  def load_category
    @category ||= category_scope.find(params[:id])
  end

  def load_excursions
    @excursions = @category.excursions.includes(:categories)
  end

  def category_scope
    Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
