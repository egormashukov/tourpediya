# City.delete_all
#
# city1 = City.create!(name: 'Moscow')
# city2 = City.create!(name: 'Kiev')
# city3 = City.create!(name: 'Sevastopol')
# city4 = City.create!(name: 'Saint-Pitersburg')
#
# Category.delete_all
# category1 = Category.create!(name: 'Historical')
# category2 = Category.create!(name: 'Museum')
# category3 = Category.create!(name: 'City')
#
# Excursion.delete_all
# 1.upto 6 do |i|
#   excursion = Excursion.create!(title: "Good Moscow #{i} excursion")
#   city1.excursions << excursion
#   excursion.categories << [category1, category2]
# end
#
# city2.excursions << Excursion.create!(title: 'Awesome Kiev excursion')
# city3.excursions << Excursion.create!(title: 'Not bad Sevastopol excursion')
#

City.delete_all
Category.delete_all
Excursion.delete_all
ExcursionEvent.delete_all

User.where(email: 'admin@example.com').first_or_create(password: 'password', password_confirmation: 'password')

4.times {
  city = FactoryGirl.create(:city)

  (rand*4 + 1).to_i.times {
    excursion = FactoryGirl.create(:excursion, city_id: city.id)

    (rand*4 + 1).to_i.times {
      excursion.categories << FactoryGirl.create(:category)
    }
  }
}