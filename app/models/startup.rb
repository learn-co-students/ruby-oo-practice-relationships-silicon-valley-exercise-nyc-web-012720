'require pry'

class Startup #has many Venture Capitalists
    attr_accessor :name, :domain
    attr_reader :founder #would domain be up here or accessor?
    @@all = []
    @@domains = []

    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << self.domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.select{|startup|startup.founder==founder}
    end

    def self.domains #can use maps method instead
        @@domains
    end

    def pivot(domain,name)
        self.domain = domain
        self.name = name
    end

    def sign_contract(vc,type,investment)
        FundingRound.new(self,vc,type,investment)
    end

    def num_funding_rounds#same thing as meals
        FundingRound.all.select {|fr|fr.startup == self}
    end

    def total_funds#same thing as total words
        rounds_array = self.num_funding_rounds.map{|round|round.investment}
        rounds_array.reduce(0) {|total,num|total+num}
    end

    def investors #same as waiter (should say class on otherside of joining class)
        self.num_funding_rounds.map {|fr|fr.venture_capitalist}.uniq
    end

    def big_investors
        investors = self.investors
        tres_commas_club_investors = VentureCapitalist.tres_commas_club
        investors & tres_commas_club_investors
    end




end
