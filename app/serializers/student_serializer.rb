class StudentSerializer < ActiveModel::Serializer
  attributes :name, :major, :age, :id

  belongs_to :instructor
end
