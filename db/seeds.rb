City.delete_all
city1 = City.create!(name: 'Moscow')
city2 = City.create!(name: 'Kiev')
city3 = City.create!(name: 'Sevastopol')
city4 = City.create!(name: 'Saint-Pitersburg')

Category.delete_all
category1 = Category.create!(name: 'Historical')
category2 = Category.create!(name: 'Museum')
category3 = Category.create!(name: 'City')

Excursion.delete_all
1.upto 6 do |i|
  excursion = Excursion.create!(title: "Good Moscow #{i} excursion")
  city1.excursions << excursion
  excursion.categories << [category1, category2]
end

city2.excursions << Excursion.create!(title: 'Awesome Kiev excursion')
city3.excursions << Excursion.create!(title: 'Not bad Sevastopol excursion')
