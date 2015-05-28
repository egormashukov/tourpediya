FactoryGirl.define do
  sequence :name do |i|
    "Category #{i}"
  end
  factory :category do
    name
  end
end