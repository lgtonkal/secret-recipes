class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :created_at, :updated_at
  
end
