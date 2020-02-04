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
        self.all.select do |vc| 
            vc.total_worth >= 1000000000
        end 
    end 

    def offer_contract(start_up, type, investment)
        FundingRound.new(start_up, self, type, investment)
    end 

    def funding_rounds 
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end 

    def portfolio
        funding_rounds.map do |round|
            round.start_up
        end.uniq
    end 

    def biggest_investment
        list_of_investments = funding_rounds.map do |round|
            round.investment
        end

        biggest_value = list_of_investments.max

        funding_rounds.find do |round|
            round.investment == biggest_value
        end 
    end

    def invested(domain_string)
        domain_total = 0 
        funding_rounds.each do |round|
            if round.start_up.domain == domain_string
                domain_total += round.investment 
            end 
        end
        domain_total 
    end 

end





