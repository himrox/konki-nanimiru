# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#  username               :string
#  twitter_account        :string
#

FactoryGirl.define do
  sequence :email do |n|
    "sample#{n}@example.com"
  end

  sequence :username do |n|
    "example#{n}"
  end

  factory :user do
    email
    username
    password 'password'
    password_confirmation 'password'
    admin true
  end
end
