class Startup

    @@startups = []

    attr_accessor :name
    attr_reader :founder, :domain

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@startups << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@startups
    end

    def self.find_by_founder(founder_name)
        @@startups.find { |founder| founder.founder == founder_name}
    end

    def self.domains
        @@startups.map { |startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.length 
    end

    def total_funds
        arr = FundingRound.all.map { |round| round.investment}
        arr.sum()
    end

    def investors
        arr = FundingRound.all.map { |round| round.venture_capitalist}
        arr.uniq
    end

    def big_investors
        # self.investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor)}
        self.investors & VentureCapitalist.tres_commas_club
    end



end
