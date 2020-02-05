class VentureCapitalist
    attr_accessor :name, :total_worth
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
        #find all the investors with $1mil or more
        tres_club = @@all.select do |investor|
            investor.total_worth > 1000000000
        end 
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |round|
            round.startup
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(self, startup, type, investment)
    end

    def biggest_investment
        max = 0
        fund_round = nil
        self.funding_rounds.each do |round|
            if round.investment > max
                max = round.investment
                fund_round = round
            end
        end
        return fund_round
    end

    def invested(domain)
        
        dom = self.portfolio.select do |round|
            round.domain == domain
        end
        dom.map do |invest|
            invest.investment
        end.sum
    end
end
