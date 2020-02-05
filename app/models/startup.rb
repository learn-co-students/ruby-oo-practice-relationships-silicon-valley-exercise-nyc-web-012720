class Startup

    @@all = []

    attr_reader :founder, :domain
    attr_accessor :name


        def initialize(name, founder, domain)
            @name = name
            @founder = founder
            @domain = domain

            @@all << self
        end

def self.all
    @@all
end

def pivot(domain, name)
    @domain = domain
    @name = name
end

def self.find_by_founder(f_name)
    self.all.find{|startup| startup.founder == f_name}
end

def self.domains
    self.all.map{|startup| startup.domain}
end

def sign_contract(vc_object, investment_name, amount) 
    FundingRound.new(self, vc_object, investment_name, amount.to_f)
end

def num_funding_rounds
    FundingRound.all.select{|funding| funding.startup == self}.count
end

def total_funds
   startup_funds = FundingRound.all.select{|funding| funding.startup == self}
   startup_funds.map{|funding| funding.investment}.sum
end

def investors
    funding_startup = FundingRound.all.select{|f| f.startup == self}
    return funding_startup.map{|fr| fr.venture_capitalist}.uniq
end

def big_investors
    self.investors.select{|vc| VentureCapitalist.tres_commas_club.include? vc}
end

end




