module Weather

def check_weather
	rand(1..10)
		if rand (1..6)
			return :sunny
		else
		if rand (8..10)
			return :stormy
		end
	end
end

def sunny?
	check_weather == :sunny
end

def stormy?
	check_weather == :stormy
end

end