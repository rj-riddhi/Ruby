class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :followers, :following
end
