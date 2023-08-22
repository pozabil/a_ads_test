class User < ApplicationRecord
  ADDITIONAL_PARAMETERS_FOR_DEVISE = %i[name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :relationships, dependent: :destroy
  has_many :followers, through: :relationships, dependent: :destroy
  has_many :followee, through: :relationships, dependent: :destroy
end
