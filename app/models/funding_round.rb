class FundingRound

    attr_accessor  :type, :amount
    attr_reader :startup, :venture_capitalist
    @@all = []

    def initialize(startup, venture_capitalist, type, amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @amount = amount

        @@all << self
    end

    def self.all
        @@all
    end

end
