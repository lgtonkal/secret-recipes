class RecipeDetailSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :optional, :created_at, :updated_at

  belongs_to :recipe
  belongs_to :unit, optional: true
  belongs_to :material, optional: true

end
