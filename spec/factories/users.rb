FactoryBot.define do
  factory :user do
    name { generate(:name) } 
  end

  sequence :name do |n|
    "#Gob_{n}"
  end
end

