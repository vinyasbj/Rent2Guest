class Amenity < ActiveRecord::Base
  validates_presence_of :name ,:description
  validates_length_of :description ,minimum: 15
end
