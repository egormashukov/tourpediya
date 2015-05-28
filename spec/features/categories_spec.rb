require 'rails_helper'

describe 'Category' do
  let!(:excursion1) { FactoryGirl.create(:excursion) }
  let!(:excursion2) { FactoryGirl.create(:excursion) }
  let!(:category) { FactoryGirl.create(:category) }

  before { category.excursions << [excursion1, excursion2] }

  describe '#show page' do
    context 'has category data' do
      before { visit category_path(category) }
      subject { page }
      specify do
        should have_content "Category #{category.name}"
        should have_link excursion1.title
        should have_link excursion2.title
      end
    end
  end
end
