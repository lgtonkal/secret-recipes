class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :description, :preparation_time, :cooking_time, :portion, :created_at, :updated_at

  belongs_to :food
  has_many :recipe_details

end
