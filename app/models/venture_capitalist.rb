class VentureCapitalist

    attr_accessor :name, :total_worth
    @@all=[]

    def initialize (name,total_worth=0)
        @name=name
        @total_worth=total_worth
        @@all << self
    end


    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|w| w.total_worth>1000000000}
    end


    def offer_contract(vc,type,amount)
        FundingRound.new(self,vc,type,amount)
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist==self}
    end

    def portfolio
        self.funding_rounds.map {|fr| fr.startup}.uniq
    end


    def biggest_investment
        self.funding_rounds.max_by{|fr| fr.investment}
    end

    def invested(name)
        start_up=Startup.all.select{|d| d.domain==name}
        # p start_up
        
        start_up.reduce(0){|sum,d| sum+d.total_funds}
        # p sum 
        # p d
        

    end



end
