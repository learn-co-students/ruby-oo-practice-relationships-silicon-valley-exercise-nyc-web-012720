class Startup

    attr_reader :founder, :domain, :name

    @@all_startups = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all_startups << self
    end 

# # #   I N S T A N C E   M E T H O D S   # # #

    def pivot(domain, name)
        self.domain = domain
        self.name = name
        self
    end 

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def num_funding_rounds
        funding_rounds.count
    end 

    def total_funds
        funding_rounds.reduce(0) do |acc, round|
            acc + round.investment
        end 
    end 

    def investors 
        venture_capitalists.name
    end 

    def big_investors
        venture_capitalists.select do |capitalist|
            capitalist.baller?
        end
    end 

# # #   C L A S S   M E T H O D S   # # #

    def self.all
        @@all_startups
    end 

    def self.find_by_founder(founder_name)
        all.find do |startup|
            startup.founder == founder_name
        end 
    end 

    def self.domains
        all.map do |startup|
            startup.domain
        end 
    end 

# # #   P R I V A T E   M E T H O D S   # # #

    private 

    attr_writer :domain, :name

    def venture_capitalists
        FundingRound.all.select do |fund|
            fund.startup == self 
        end.map do |fund|
            fund.venture_capitalist
        end.uniq
    end 

    def funding_rounds
        FundingRound.all.select do |fund|
            fund.startup == self
        end
    end 

end 