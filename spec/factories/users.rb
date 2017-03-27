FactoryGirl.define do
  factory :user do
    
    firstname "John"
    lastname  "Doe"    
    
    email     Faker::Internet.email
    password 'topsecret'
    password_confirmation 'topsecret' 
    
  end
end
