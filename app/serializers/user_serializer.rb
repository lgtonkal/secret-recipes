class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :created_at, :updated_at
end
