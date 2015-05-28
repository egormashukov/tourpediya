class CreateExcursionCategories < ActiveRecord::Migration
  def change
    create_table :excursion_categories do |t|
      t.belongs_to :category
      t.belongs_to :excursion

      t.timestamps
    end
  end
end
