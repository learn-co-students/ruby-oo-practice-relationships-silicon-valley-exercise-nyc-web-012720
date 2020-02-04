class VentureCapitalist

    attr_accessor :name, :startup, :total_worth
    @@all = []

    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds#same thing as meals
        FundingRound.all.select {|fr|fr.venture_capitalist == self}
    end

    def portfolio 
        self.funding_rounds.map {|fr|fr.startup}.uniq
    end

    def biggest_investment
        investments = self.funding_rounds.map {|fr|fr.investment}
        largest_investment = investments.max
        FundingRound.all.find {|fr|fr.investment == largest_investment}
    end

    def invested(domain)
        funding_round_by_domain = self.funding_rounds.find {|fr|fr.startup.domain == domain}
        startup = funding_round_by_domain.startup
        startup_funding_rounds = startup.num_funding_rounds
        total_invested = startup_funding_rounds.map {|fr|fr.investment}.sum
        total_invested
    end

    

end
