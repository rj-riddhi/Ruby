class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, :followed_id, presence: true
  validate :cannot_follow_self

  def cannot_follow_self
    errors.add(:followed_id, "can't be the same person") if follower_id == followed_id
  end
end
