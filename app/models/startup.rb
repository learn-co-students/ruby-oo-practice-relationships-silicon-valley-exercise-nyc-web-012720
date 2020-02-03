class Startup

attr_accessor :name, :total_funding, :all_funders
attr_reader :founder, :domain
@all_funders = []
@@all = []
@@all_domains =[]

def initialize (name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self

end

def pivot (domain, name)
    @domain = domain
    @name = name
    
end

def self.all
    @@all
end

def self.find_by_founder (founder)
    self.all.find {|startup| startup.founder == founder}
end

def self.domains
    self.all.each do |startup| 
    @@all_domains << startup.domain
    end
    @@all_domains.uniq
end

def sign_contract (venture_capitalist, type, amount)
    FundingRound.new(self, venture_capitalist, type, amount)
end

def funders
    FundingRound.all.select {|funding_round| funding_round.startup == self}
end

def num_funding_rounds
    FundingRound.all.select {|funding_round| funding_round.startup == self}.size
end

def total_funding
    total_funds = 0
    @all_funders = FundingRound.all.select {|funding_round| funding_round.startup == self}
    @all_funders.each do |funders|
        total_funds += funders.investment
    end
    total_funds
end

def investors
    investor_names = []
    @all_funders = FundingRound.all.select {|funding_round| funding_round.startup == self}
    @all_funders.each do |funders|
        investor_names << funders.venture_capitalist
    end
    investor_names.uniq
end

def big_investors
    big_investors = []
    self.funders.each do |funders|
        if funders.venture_capitalist.total_worth > 1000000000
        big_investors << funders.venture_capitalist
        end
    end
    big_investors.uniq
end


end
