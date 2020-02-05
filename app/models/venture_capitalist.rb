class VentureCapitalist

    attr_accessor :name, :total_worth
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
        self.all.select{|company| company.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def contracts
        FundingRound.all.select{|round| round.venture_capitalist == self }
    end

    def funding_rounds
        self.contracts.length
    end

    def portfolio
        self.contracts.map{|contract| contract.startup}.uniq
    end

    def biggest_investment
        max = self.contracts.map{|contract| contract.amount}.max
        self.contracts.select{|contract| contract.amount == max}
    end

    def invested(domain_string)
        company = self.contracts.find{|contract| contract.startup.domain == domain_string}
        return company.amount
    end
end
