module Weather

# attr_accessor :weather

def check_weather
	return :sunny if rand(1..6)
	return :stormy if rand(8..10)
end



# def random_weather
# 	rand(1..10)
# end

def sunny?
	check_weather == :sunny
end

def stormy?
	check_weather == :stormy
end




end