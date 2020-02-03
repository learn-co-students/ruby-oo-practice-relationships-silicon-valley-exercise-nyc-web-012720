class Startup

    
    attr_reader :founder, :name, :domain
    # attr_accessor :funding_rounds

    @@all=[]

    def initialize (name,founder,domain)
        @name =name
        @founder=founder
        @domain=domain
        @@all << self
        # @funding_rounds=0
        # @total_funds=0
    end

    def pivot(name,domain)
        @domain=domain
        @name=name
    end

    def self.all
        @@all
    end


    def self.find_by_founder(name)
        @@all.find {|n| n.founder==name}
    end

    def self.domains
        @@all.map {|d| d.domain}
    end

    def sign_contract(vc,type,amount)
        FundingRound.new(self, vc, type, amount)
        # @funding_rounds+=1
        # @total_funds+=amount
    end


    def num_funding_rounds
        # @funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}.count
    end

    def total_funds
        # @total_funds
        startup_fr=FundingRound.all.select{|fr| fr.startup == self}
        startup_fr.reduce(0) {|sum ,i| sum + i.investment}
    end

    def investors

         startsups_frs = FundingRound.all.select{|fr| fr.startup == self}

       startsups_frs.map{|fr| fr.venture_capitalist }.uniq

    end

    def big_investors

        self.investors.select {|investor| investor.total_worth>1000000000}

    end










end
