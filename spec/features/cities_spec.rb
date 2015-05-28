require 'rails_helper'

describe 'Cities' do
  before do
    @city1 = FactoryGirl.create :city
    @city2 = FactoryGirl.create :city
    @excursion1 = FactoryGirl.create(:excursion)
    @excursion2 = FactoryGirl.create(:excursion)

    @city1.excursions << @excursion1
  end

  describe '#index page' do
    context 'has only those cities that has excursions' do
      before { visit root_path }
      subject { page }
      specify do
        should have_content @city1.name
        should_not have_content @city2.name
        should have_content @excursion1.title
      end
    end
  end

  describe '#show page' do
    before { visit city_path(@city1) }
    subject { page }
    specify 'should show city data' do
      should have_content @city1.name
      should have_content @excursion1.title
      should_not have_content @city2.name
      should_not have_content @excursion2.title
    end
  end
end
