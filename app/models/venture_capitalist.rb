class VentureCapitalist

    @@all = []

    attr_accessor :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

def self.all
    @@all
end

def self.tres_commas_club
    VentureCapitalist.all.select{|vc| vc.total_worth > 1000000000} 
end

def offer_contract(st_object, type, investment)
   FundingRound.new(st_object, self, type, investment)
end

def funding_rounds
    FundingRound.all.select{|fr| fr.venture_capitalist == self}
end

def portfolio
#Returns a unique list of all startups this venture capitalist has funded
    self.funding_rounds.map{|fr| fr.startup}
end

def biggest_investment
    #returns the largest funding round given by this venture capitalist
    self.funding_rounds.sort{|fr1, fr2| fr1.investment <=> fr2.investment}.last
end

def invested(st_domain)
    #given a domain string, returns the total amount invested in that domain
    fr_domain = self.funding_rounds.select{|fr| fr.startup.domain == st_domain}
    total = fr_domain.map{|fr| fr.investment}.sum 
end
end
