class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :grade, :parent, :phone_number, :email
end
