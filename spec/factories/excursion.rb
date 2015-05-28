FactoryGirl.define do
  sequence :title do |i|
    "Excursion #{i}"
  end
  factory :excursion do
    title
    description { Faker::Lorem.sentence }
    city

    trait :published do
      published true
    end

    trait :viewed do
      viewed true
    end
  end
end
