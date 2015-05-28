class CategoriesController < ApplicationController

  # def index
  #   load_categories
  # end
  #
  # def new
  #   build_category
  # end

  def show
    load_category
    load_excursions
  end
  #
  # def create
  #   build_category
  #   save_category || render(:new)
  # end
  #
  # def edit
  #   load_category
  #   build_category
  # end
  #
  # def update
  #   load_category
  #   build_category
  #   save_category || render(:edit)
  # end
  #
  # def destroy
  #   load_category
  #   destroy_category
  #   redirect_to :categories
  # end

  private

  def load_categories
    @categories ||= category_scope.joins(:index_excursions).includes(:index_excursions)
  end

  def load_category
    @category ||= category_scope.find(params[:id])
  end

  def load_excursions
    @excursions = @category.excursions.includes(:categories)
  end

  def category_scope
    Category.all
  end

  def build_category
    @category ||= category_scope.build
    @category.attributes = category_params
  end

  def save_category
    @category.save
  end

  def destroy_category
    @category.destroy
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
