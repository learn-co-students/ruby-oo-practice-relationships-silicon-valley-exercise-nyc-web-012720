class FundingRound

    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    @@rounds = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment.to_f
        @@rounds << self
    end

    def self.all
        @@rounds
    end


end
