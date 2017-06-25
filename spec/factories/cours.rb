# == Schema Information
#
# Table name: cours
#
#  id         :integer          not null, primary key
#  year       :integer
#  season     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cours_on_year_and_season  (year,season) UNIQUE
#

FactoryGirl.define do

  factory :cour do
    year Date.today.year
    season (Date.today.mon / 3.0).ceil
  end
end
