# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint
#  post_id    :bigint
#
# Indexes
#
#  index_comments_on_account_id  (account_id)
#  index_comments_on_post_id     (post_id)
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account

  validates_presence_of :message, :account_id, :post_id
end
