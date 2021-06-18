# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  body           :text
#  downvotes      :integer          default(0)
#  title          :string
#  total_comments :integer          default(0)
#  upvotes        :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :bigint
#  community_id   :bigint
#
# Indexes
#
#  index_posts_on_account_id    (account_id)
#  index_posts_on_community_id  (community_id)
#
class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  has_many :comments

  validates_presence_of :title, :body, :account_id, :community_id

  def score
    if self.upvotes > 0 || self.downvotes > 0
      self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
    else
      0
    end
  end
end
