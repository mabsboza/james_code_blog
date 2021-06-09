# == Schema Information
#
# Table name: communities
#
#  id             :bigint           not null, primary key
#  name           :string
#  rules          :text
#  total_memebers :integer
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :bigint
#
# Indexes
#
#  index_communities_on_account_id  (account_id)
#
class Community < ApplicationRecord
  belongs_to :account
  has_many :posts
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :accounts

  validates_presence_of :name, :url, :rules
end
