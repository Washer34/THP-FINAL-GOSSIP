class Gossip < ApplicationRecord
  belongs_to :user
  has_many :intertags
  has_many :comments
  has_many :likes, as: :imageable
  has_many :tags, through: :intertags
  has_many :pouces
  def pouced?(user)
    !!self.pouces.find{|pouce| pouce.user_id == user.id}
  end
  validates :content, presence: true
  validates :title, presence: true, length: {minimum: 3, maximum: 14}
end
