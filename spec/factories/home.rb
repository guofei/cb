FactoryGirl.define do
  factory :school, aliases: [:homeschool] do
    name "tsukuba"
    city "tsukuba"
    region "ibaraki"
  end

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "123456"
    token "tadf"
    provider "facebook"
    havemessage false
    school
  end

  factory :category do
    name "book"
  end

  factory :commodity do
    name "book"
    num 5
    desc "my book!!"
    price 123
    photo "/a.png"
    place "school"
    user
  end

  factory :commoditycate, :class => CommodityCate do
    commodity
    category
  end

  factory :popular do
    commodity
  end
end
