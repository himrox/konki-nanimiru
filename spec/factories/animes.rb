FactoryGirl.define do
  factory :anime do
    title 'エロマンガ先生'
    api_number 565
    association :cour, factory: :cour
  end
end
