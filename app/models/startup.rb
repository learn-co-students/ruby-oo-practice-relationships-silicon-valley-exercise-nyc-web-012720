require 'pry'

class Startup
    attr_accessor :founder
    attr_reader :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(name, domain) # to change a startups name and domain startup.pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.find_by_founder(founder_name) #returns the first instance of founder that matches the founder_name argument
        @@all.find do |startup| 
            startup.founder == founder_name
        end
    end

    def self.domains #returns an array of all the domains
        @@all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(type, amount, vc) 
        FundingRound.new(type, amount, self, vc) #self = startup
    end

    def num_funding_rounds
        num_rounds = FundingRound.all.select do |funding_round| #goes over the array of funding rounds
            funding_round.startup == self #if the funding_round.startup instance, returns startup passed in
        end
        num_rounds.count #returns the cound of the array
    end

    def total_funds
        rounds_per_startup = FundingRound.all.select { |funding_round|
            funding_round.startup == self }
        rounds_per_startup.inject { |sum, amt| sum + amt.investment }
    end

    def investors
        rounds_per_startup = FundingRound.all.select { |funding_round|
        funding_round.startup == self }
        rounds_per_startup.map { |fr| fr.venture_capitalist }.uniq
    end

    def big_investors
        investors.select { |vc| vc.total_worth > 1000000000 }.uniq
    end

    
end
