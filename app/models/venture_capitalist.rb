class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|x| x.total_worth > 1000000 }
    end

    def offer_contract (startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|x| x.venture_capitalist == self}
    end

    def portfolio
        arr = self.funding_rounds.map {|x| x.startup}
        arr.uniq
    end

    def biggest_investment
        self.funding_rounds.max(1) {|round_a, round_b| round_a.investment <=> round_b.investment}
    end

    def invested(domain)
        get_startup_obj = Startup.all.select {|startup| startup.domain == domain}
        #arr is an array of startup objects
        startup_object_round = FundingRound.all.select {|round| round.startup == get_startup_obj[0]}
        total = startup_object_round.select {|round| round.venture_capitalist == self }
        new_total = total.map {|round| round.investment}
        new_total.sum
        # total.investment.sum()
    end
end
