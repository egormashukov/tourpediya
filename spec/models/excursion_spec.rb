require 'rails_helper'

describe Excursion do
  it { should belong_to :city                 }
  it { should have_many :excursion_events     }
  it { should have_many :excursion_categories }
  it { should have_many :categories           }
  it { should validate_presence_of :title     }
  it { should validate_uniqueness_of :title   }

  let!(:excursion){ FactoryGirl.create :excursion }
  let!(:viewed_excursion){ FactoryGirl.create :excursion, :viewed }

  describe 'self.viewed' do
    subject { Excursion.viewed }
    it { should == [viewed_excursion] }
  end

  describe 'self.without' do
    subject { Excursion.without(viewed_excursion.id) }
    it { should == [excursion] }
  end
end
