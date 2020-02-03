class FundingRound

attr_accessor :type, :investment
attr_reader :startup, :venture_capitalist

@@all = []

	def initialize(type, startup, venture_capitalist, investment)
		@@all << self
		@type = type
		@startup = startup
		@venture_capitalist = venture_capitalist
		@investment = investment
	end

	def self.all
		return @@all
	end


end