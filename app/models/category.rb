class Category < ActiveRecord::Base
  has_many :excursion_categories, dependent: :destroy
  has_many :excursions, through: :excursion_categories

  validates :name, presence: true, uniqueness: true
end
