class ExcursionsController < ApplicationController
  before_filter :load_excursion

  def show
    load_viewed_excursions
    check_viewed
  end

  def unview
    unview_excursion
    redirect_to :back
  end

  def update
    build_excursion
    save_excursion
    write_event
    redirect_to :back
  end

  private

  def write_event
    ExcursionEvent.create user: current_user, excursion: @excursion, event: 'edit_description'
  end

  def unview_excursion
    @excursion.unview if @excursion.viewed?
  end

  def check_viewed
    @excursion.view unless @excursion.viewed?
  end

  def load_excursions
    @excursions ||= excursion_scope.joins(:index_excursions).includes(:index_excursions)
  end

  def load_excursion
    @excursion ||= excursion_scope.find(params[:id])
  end

  def load_viewed_excursions
    @viewed_excursions = excursion_scope.viewed.without(@excursion.id)
  end

  def excursion_scope
    Excursion.all
  end

  def build_excursion
    @excursion ||= excursion_scope.build
    @excursion.attributes = excursion_params
  end

  def save_excursion
    @excursion.save
  end

  def destroy_excursion
    @excursion.destroy
  end

  def excursion_params
    params.require(:excursion).permit(:title, :description, :published, :viewed, :city_id)
  end
end
