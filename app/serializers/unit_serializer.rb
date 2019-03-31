class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :shortcode, :created_at, :updated_at
end
