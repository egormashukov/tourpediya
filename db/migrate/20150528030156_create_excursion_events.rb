class CreateExcursionEvents < ActiveRecord::Migration
  def change
    create_table :excursion_events do |t|
      t.belongs_to :user
      t.belongs_to :excursion
      t.string :event

      t.timestamps
    end
  end
end
