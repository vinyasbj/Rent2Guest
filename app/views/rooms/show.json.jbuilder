json.(@room ,:id,:name,:price,:address)

json.user do |json|
	json.(@room.user,:id,:username) 
	json.url user_url(@room.user)
end

json.bookings @room.bookings, :id ,:start_date, :end_date ,:is_confirmed, :amount
# json.bookings @room.bookings do |json, booking|
# 	json.(booking, :id,:start_date,:end_date)
# end