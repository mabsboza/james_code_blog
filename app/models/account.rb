# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  bio                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_accounts_on_email                 (email) UNIQUE
#  index_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#
class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions
  has_many :communities, through: :subscriptions
  has_many :posts
  has_many :comments

  validates_presence_of :first_name, :last_name, :user_name
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
