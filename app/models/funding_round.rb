class FundingRound

    @@all = []

    attr_accessor :type
    attr_reader :startup, :venture_capitalist, :investment

    def initialize (startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        if investment > 0
            @investment = investment.to_f
        end
        @@all << self
    end

    def self.all
        @@all
    end


end
