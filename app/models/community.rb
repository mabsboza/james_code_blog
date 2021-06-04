class Community < ApplicationRecord
  belongs_to :account
  validates_presence_of :name, :url, :bio
end