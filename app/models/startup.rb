class Startup

    attr_reader :name, :founder, :domain

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

    def pivot(domain, name)
        @domain= domain
        @name= name
    end

    def self.find_by_founder(founder_name)
        self.all.find{|company| company.founder == founder_name}
    end

    def self.domains
        self.all.map{ |company| company.domain}
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def contracts
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        self.contracts.length
    end

    def total_funds
        self.contracts.map{|round| round.amount}.sum
    end

    def investors
        self.contracts.map{|investor| investor.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end

end
