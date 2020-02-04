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
        @@all.select  {|venturecapitalist| venturecapitalist.total_worth > 1000000000}
    end 

    def offer_contract (startup_obj, type_investment, amount_invested)
        funding_round = FundingRound.new(startup_obj, self.name, type_investment, amount_invested)
    end

    def funding_rounds
        FundingRound.all.select {|fund| fund.venture_capitalist == self}
    end 

    def portfolio 
        sum = self.funding_rounds.map { |fr| fr.startup }.uniq
    end
    
    def biggest_investment
        max = 0 
        larget_f = nil
        self.funding_rounds.each do   |fr| 
            if (fr.investment> max )
                larget_f = fr 
                max = fr.investment
            end
        end
        larget_f
    end 
    def invested (domain_string)
        startup_arr = self.funding_rounds.map { |fr| fr.startup }
        target_startup_arr = startup_arr.select {|startup| startup.domain == domain_string}
        total = 0
        target_startup_arr.each {|startup| total += startup.total_funds}
        total
    end 
    
end
