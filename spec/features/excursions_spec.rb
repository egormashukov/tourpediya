require 'rails_helper'

describe 'Excursions' do
  let!(:viewed_excursion) { FactoryGirl.create(:excursion) }

  describe '#show' do
    context 'should show excursion data' do
      before { visit excursion_path(viewed_excursion) }
      subject { page }

      specify do
        should have_content "Excursion #{viewed_excursion.title}"
      end
    end
  end

  describe 'sidebar' do

    describe 'no viewed excursions even viewed self' do
      before { visit excursion_path(viewed_excursion) }
      subject { page }
      specify do
        within '.sidebar-nav' do
          should have_content 'No Viewed Excursions'
          should_not have_content viewed_excursion.title
        end
      end
    end

    describe 'has viewed excursions' do
      let!(:viewed_excursion1) { FactoryGirl.create(:excursion, :viewed) }
      let!(:viewed_excursion2) { FactoryGirl.create(:excursion, :viewed) }
      let!(:excursion) { FactoryGirl.create(:excursion) }

      before { visit excursion_path(viewed_excursion) }
      subject { page }

      specify do
        within '.sidebar-nav' do
          should_not have_content viewed_excursion.title
          should_not have_content excursion.title
          should have_content viewed_excursion1.title
          should have_content viewed_excursion2.title
        end
      end
    end
  end
end
