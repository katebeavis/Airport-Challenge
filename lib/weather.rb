module Weather


def weather
	@weather
	@weather=random_weather
end
# attr_accessor :weather

def random_weather
	rand(1..10)
end

def sunny?
	weather == (1..6)
end

def stormy?
	weather == (8..10)
end




end