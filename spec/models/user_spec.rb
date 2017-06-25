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
#  image                  :string
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(username: "test", email: "test@example.com", password: "password")
  end

  it "username, email, passwordがあれば有効であること" do
    expect(@user).to be_valid
  end

  it "usernameが無ければ無効であること" do
    @user.username = ""
    expect(@user).not_to be_valid
  end

  it "emailが無ければ無効であること" do
    @user.email = ""
    expect(@user).not_to be_valid
  end

  it "passwordが無ければ無効であること" do
    @user.password = ""
    expect(@user).not_to be_valid
  end
end
