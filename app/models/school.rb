class School < ApplicationRecord
  # validation
  validates_presence_of :name
  #assocations
  has_many :courses
  # callbacks
  # instance methods
  # Class methods

end
