# load "./load_cities.rb"

cities =  File.read("./cities.json")
cities_hash = JSON.parse(cities)

cities_hash.each do |city|
	City.create(name: city["name"],state: city["state"])
end