class RecipeDetail < ApplicationRecord
  belongs_to :recipe
  belongs_to :unit, optional: true
  belongs_to :material, optional: true
end
