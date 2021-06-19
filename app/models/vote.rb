# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  upvote     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint
#  post_id    :bigint
#
# Indexes
#
#  index_votes_on_account_id  (account_id)
#  index_votes_on_post_id     (post_id)
#
class Vote < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates_uniqueness_of :account_id, scope: :post_id

  after_create :increase_vote, :add_karma
  after_destroy :decrement_vote, :remove_karma


  private

  def increase_vote
    field = self.upvote ? :upvotes : :downvotes
    Post.find(self.post_id).increment(field).save
  end

  def decrement_vote
    field = self.upvote ? :upvotes : :downvotes
    Post.find(self.post_id).decrement(field).save
  end

  def add_karma
    account =  Account.find(self.account_id)
    account.increment(:karma, 1).save
  end

  def remove_karma
    account =  Account.find(self.account_id)
    account.decrement(:karma, 1).save
  end

end
