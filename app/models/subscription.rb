# == Schema Information
#
# Table name: subscriptions
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint
#  community_id :bigint
#
# Indexes
#
#  index_subscriptions_on_account_id    (account_id)
#  index_subscriptions_on_community_id  (community_id)

class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :community

end