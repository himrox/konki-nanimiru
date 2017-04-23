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

FactoryGirl.define do
  factory :cour do
    year 2017
    season 1
  end
end
