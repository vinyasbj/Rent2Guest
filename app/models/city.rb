class City < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :room
end
