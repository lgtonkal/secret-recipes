class Recipe < ApplicationRecord
  belongs_to :food
  has_many :recipe_details, dependent: :destroy
end
