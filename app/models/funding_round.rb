class FundingRound

    attr_accessor :type, :investment
    attr_reader :start_up, :venture_capitalist

    @@all = []

    def initialize(start_up, venture_capitalist, type, investment)
    @start_up = start_up
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.abs.to_f

    @@all << self

    end
    
    def self.all 
        @@all
    end 

    

end
