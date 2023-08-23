class User < ApplicationRecord
  ADDITIONAL_PARAMETERS_FOR_DEVISE = %i[name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy
  has_many :followee_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :follower_relationships, dependent: :destroy
  has_many :followees, through: :followee_relationships, dependent: :destroy

  def is_following?(user)
    followee_relationships.exists?(followee: user)
  end

  def following_posts
    Post.where(user_id: followee_ids).order(created_at: :desc)
  end
end
