class City < ActiveRecord::Base
  has_many :excursions
  has_many :index_excursions, ->{ limit(5) }, class_name: 'Excursion'

  validates :name, presence: true, uniqueness: true
end
