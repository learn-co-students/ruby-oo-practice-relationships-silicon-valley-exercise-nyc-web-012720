class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@all_funding_rounds = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment
        @type = type
        @@all_funding_rounds << self
    end 

    def self.all
        @@all_funding_rounds
    end 

end
