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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_many :watches, dependent: :destroy
  has_many :animes, through: :watches

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_]+\z/
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  with_options if: "uid.blank?" do |signup_user|
    signup_user.validates :email, presence: true
    signup_user.validates :username, presence: true,
                                     format: { with: VALID_USERNAME_REGEX }
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.twitter_account = auth.info.nickname
      user.username = "@#{auth.info.nickname}"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # ユーザーが見ているアニメのidの配列を返す
  def watching_anime_ids
    ids = []
    self.animes.each do |anime|
      ids << anime.id
    end
    ids
  end
end
