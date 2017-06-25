# == Schema Information
#
# Table name: animes
#
#  id         :integer          not null, primary key
#  title      :string
#  public_url :string
#  cour_id    :integer
#  api_number :integer
#  story      :text
#  img_url    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_animes_on_title_and_cour_id  (title,cour_id) UNIQUE
#

FactoryGirl.define do
  factory :anime do
    title 'エロマンガ先生'
    api_number 565
    association :cour, factory: :cour
  end
end
