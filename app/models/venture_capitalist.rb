class VentureCapitalist

    @@all = []
   

    attr_accessor :name, :total_worth, :all_investments

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|capitalist| capitalist.total_worth >= 1000000000}
    end

    def offer_contract (startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def all_investments
        FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        portfolio = []
        all_investmentss = []
        all_investmentss = FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
        all_investmentss.each do |investments|
            portfolio << investments.startup
        end
        portfolio
    end

    def biggest_investment
        self.all_investments.max_by {|funding_round| funding_round.investment}
    end

    def invested (domain)
        invested_in_domain = 0
        domain_investments = []
        domain_investments = self.all_investments.select {|funding_round| funding_round.startup.domain == domain}
        domain_investments.each do |funding_round|
            invested_in_domain += funding_round.investment
        end
        invested_in_domain
    end

end
