class Excursion < ActiveRecord::Base

  belongs_to :city

  scope :viewed, -> { where(viewed: true) }
  scope :without, ->(id) { where('id <> ?', id) }
  scope :empty_description, -> { where(description: nil) }

  has_many :excursion_categories, dependent: :destroy
  has_many :categories, through: :excursion_categories
  has_many :excursion_events

  validates :title, presence: true, uniqueness: true

  def view
    self.update_attribute :viewed, true
  end

  def unview
    self.update_attribute :viewed, false
  end
end
