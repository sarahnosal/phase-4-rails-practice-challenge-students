class InstructorSerializer < ActiveModel::Serializer
  attributes :name, :id

  has_many :students
end
