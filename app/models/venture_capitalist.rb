require 'pry'

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
        @@all.select do |vc|
            vc.total_worth > 1000000000
        end
    end

    def offer_contract(type, investment, str)
        FundingRound.new(type, amount, str, self)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
       funded_startups = self.funding_rounds.map { |fr| fr.startup }
       funded_startups.uniq
    end

    def biggest_investment
        funding_rounds.sort_by { |fr| fr.investment}.last
    end

    def invested(domain)
        domain_funding_rounds = funding_rounds.select {|fr| fr.startup.domain == domain}
        domain_funding_rounds.sum { |fr| fr.investment}
    end

end
