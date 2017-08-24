class Booking < ActiveRecord::Base
	belongs_to :room
	belongs_to :user
	validates_presence_of :start_date,:end_date ,:room_id,:user_id
end
