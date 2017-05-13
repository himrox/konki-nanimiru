FactoryGirl.define do

  sequence :email do |n|
    "sample#{n}@example.com"
  end

  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end
end
