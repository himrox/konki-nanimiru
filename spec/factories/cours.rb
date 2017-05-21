FactoryGirl.define do

  factory :cour do
    year Date.today.year
    season (Date.today.mon / 3.0).ceil
  end
end
