class Course < ApplicationRecord
  #validations
  validates_presence_of :name
  #associations
  belongs_to :school
  #callbacks
  #Instance methods
  #class methods
end
