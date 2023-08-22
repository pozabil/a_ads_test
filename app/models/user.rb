class User < ApplicationRecord
  ADDITIONAL_PARAMETERS_FOR_DEVISE = %i[name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
