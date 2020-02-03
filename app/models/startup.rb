class Startup
    attr_accessor :name, :domain
    attr_reader :founder

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

    ### do these need to be private re: instructions for this class?
    def self.all
        @@all 
    end

    def self.find_by_founder(name)
        @@all.find{|startup| startup.founder == name}
    end

    def self.domains
        @@all.map{|startup| startup.domain}.uniq
    end

    ###ASSOCIATION METHODS
    def funding_rounds
        FundingRound.all.select{|rd| rd.startup == self}
    end

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount)
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.reduce(0){|total, rd| total + rd.investment}
    end

    def investors
        self.funding_rounds.map{|rd| rd.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select{|vc| vc.total_worth >= 1000000000}
    end

end
