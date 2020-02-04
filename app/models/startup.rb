class Startup
    attr_accessor :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain 
        
        @@all << self 

    end 

    def pivot(name, domain)
        @name = name 
        @domain = domain
    end 

    def self.all 
        @@all
    end 

    def self.find_by_founder(name)
        @@all.find do |start_up|
            start_up.founder == name 
        end 
    end 

    def self.domains 
        self.all.map do |start_up|
            start_up.domain
        end 
    end

    def sign_contract(vc, type, investmet)
        FundingRound.new(self, vc, type, investmet)
    end 

    #helper function 

    def funding_rounds 
        FundingRound.all.select do |round|
            round.start_up == self 
        end 
    end 

    def num_funding_rounds
        FundingRound.all.select do |round|
            round.start_up == self
        end.length
    end 

    def total_funds 
        investment_total = 0
        funding_rounds.each do |round|
            investment_total += round.investment
        end
        investment_total
    end 

    def investors
        funding_rounds.map do |round|
            round.venture_capitalist
        end.uniq
    end

    def big_investors 
        investors.select do |investor|
            investor.total_worth >= 1000000000
        end 
    end 

end
