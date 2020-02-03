class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|vc| vc.total_worth >= 1000000000}
    end

    ###ASSOCIATION METHODS
    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|rd| rd.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|rd| rd.startup}.uniq
    end

    def biggest_investment
        large_investment = 0
        largest_funding_rd = nil
        self.funding_rounds.each{|rd|
            if rd.investment > large_investment
                large_investment = rd.investment
                largest_funding_rd = rd
            end
        }
        largest_funding_rd
    end

    def invested(domain)
        Startup.all.reduce(0){|total_invested, startup|
            # total_invested + startup.total_funds
            if startup.domain == domain
                total_invested + startup.total_funds
            else 
                total_invested
            end
        }
    end
end
