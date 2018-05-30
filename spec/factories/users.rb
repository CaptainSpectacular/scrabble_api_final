FactoryBot.define do
  factory :user do
    name { generate(:name) } 
    score { generate(:score) }
  end

  sequence :name do |n|
    "#Gob_{n}"
  end

  sequence :score do |n|
    14 + n
  end
end

