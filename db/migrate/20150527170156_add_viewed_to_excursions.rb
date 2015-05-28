class AddViewedToExcursions < ActiveRecord::Migration
  def change
    add_column :excursions, :viewed, :boolean, default: false
  end
end
