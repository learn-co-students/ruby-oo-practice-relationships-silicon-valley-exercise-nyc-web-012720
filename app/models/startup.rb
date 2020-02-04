class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@startups = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@startups << self
    end

    def pivot (domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@startups
    end

    def self.find_by_founder (founder_name)
        @@startups.find {|founder| founder.founder == founder_name}
    end

    def self.domains
        @@startups.map {|x| x.domain}
    end

    def sign_contract (venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.length
    end

    def total_funds
        array = FundingRound.all.map{|x| x.investment}
        array.sum
    end

    def investors
        array = FundingRound.all.map {|x| x.venture_capitalist}
        array.uniq
    end

    def big_investors
        self.investors.select {|x| VentureCapitalist.tres_commas_club.include? x}
    end
end
