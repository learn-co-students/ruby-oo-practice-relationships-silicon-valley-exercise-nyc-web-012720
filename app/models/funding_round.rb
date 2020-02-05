class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist
    @@all = []

    def initialize (venture_capitalist, startup, type, investment)
        @venture_capitalist = venture_capitalist
        @startup = startup
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

    def investment=(investment)
        investment *= 1.00
        #investment.round(2)
        if investment <= 0
            puts "dude, invest your money"
        else
            @investment= investment
        end
        return @investment
    end 
end
