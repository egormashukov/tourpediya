class ExcursionCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :excursion
end
