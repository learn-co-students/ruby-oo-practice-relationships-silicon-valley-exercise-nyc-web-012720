class Startup
    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []
    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot=(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all 
    end 

    def self.find_by_founder(founder_name)
        this_founder = @@all.find do |startup_name|
            startup_name.founder == founder_name
        end
    end

    def sign_contract(venture_capitalist, type, investment)
       FundingRound.new(venture_capitalist, self, type, investment) 
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_of_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds().map() do |round|
            round.investment
        end.sum
    end

    def investors
        self.funding_rounds.map do |round|
            round.venture_capitalist
        end
    end

    def big_investors
        self.investors.select do |investor|
            investor.total_worth > 1000000000
        end
    end

end
