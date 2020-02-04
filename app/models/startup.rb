
class Startup
    attr_accessor :name, :founder, :domain 
    @@all = []

    def initialize
        @@all << self
    end 
    
    def pivot(domain_string, name_string)
        @domain = domain_string
        @name = name_string
    end 

    def self.all
        @@all
    end 

    def self.find_by_founder (founder_name)
        @@all.find {|s| s.founder == founder_name }
    end 

    def self.domains
        @@all.map {|startup| startup.domain}
    end 

    def sign_contract(venture_capitalis_obj, type_of_investment, amount_invested)
        funding_round = FundingRound.new(self.name, venture_capitalis_obj, type_of_investment, amount_invested)
    end 

    def num_funding_rounds 
        sum =         FundingRound.all.select {|fund| fund.startup == self} 
        total =sum.length
    end 

    def total_funds
        sum =         FundingRound.all.select {|fund| fund.startup == self} 
        total = 0
        sum.each do |invest| 
            total += invest.investment
        end
        total   
    end 

    def investors 
        sum = FundingRound.all.select {|fund| fund.startup == self} 
        # p sum
        p sum.map {|fr| fr.venture_capitalist }.uniq

    end 

    def big_investors
        investors.select  {|venturecapitalist| (venturecapitalist.total_worth > 1000000000)}
    end 
    
end
