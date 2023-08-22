class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :follower, uniqueness: { scope: :followee }

  validate :validate_follower_and_followee_are_not_equal

  def validate_follower_and_followee_are_not_equal
    if follower_id == followee_id
      errors.add(:base, "Follower and followee must be different!")
    end
  end
end
