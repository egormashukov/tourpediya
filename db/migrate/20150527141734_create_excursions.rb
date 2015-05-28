class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.string :title, null: false, unique: true
      t.text :description
      t.boolean :published, default: false
      t.belongs_to :city
      
      t.timestamps
    end
  end
end
