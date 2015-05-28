FactoryGirl.define do
  factory :excursion do
    title { Faker::Lorem.sentence }
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
