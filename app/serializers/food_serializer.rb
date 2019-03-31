class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :created_at, :updated_at

  has_many :recipes
  has_many :categories

end
