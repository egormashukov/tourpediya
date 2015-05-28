require 'rails_helper'

describe City do
  it { should have_many :excursions           }
  it { should have_many :index_excursions     }
  it { should validate_presence_of :name      }
  it { should validate_uniqueness_of :name    }
end
