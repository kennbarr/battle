class Player

	attr_reader :name, :hit_points

	def initialize(name)
		@name = name
		@hit_points = 50
	end
	def got_attacked
		@hit_points -= 10
	end
end