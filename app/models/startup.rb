class Startup

    attr_accessor :domain, :name
    attr_reader :founder

    @@all_startups = []
    @@all_domains = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all_startups << self
        @@all_domains << @domain
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
        self.funding_rounds.count
    end 

    def total_funds
        self.funding_rounds.reduce(0) do |acc, round|
            acc + round.investment
        end 
    end 

    def investors 
        self.venture_capitalists.name
    end 

    def big_investors
        self.venture_capitalists.select do |capitalist|
            capitalist.total_worth > 1000000000
        end
    end 

# # #   C L A S S   M E T H O D S   # # #

    def self.all
        @@all_startups
    end 

    def self.find_by_founder(founder_name)
        @@all_startups.find do |startup|
            startup.founder == founder_name
        end 
    end 

    def self.domains
        @@all_domains 
    end 

# # #   H E L P E R   M E T H O D S   # # #

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