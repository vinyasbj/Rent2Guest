class Amenity < ActiveRecord::Base
  validates_presence_of :name ,:description
  # validates_length_of :description ,minimum: 15

  has_many :amenity_rooms
  has_many :rooms ,through: :amenity_rooms
end
