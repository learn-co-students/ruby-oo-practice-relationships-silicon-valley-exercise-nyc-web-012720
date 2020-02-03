class VentureCapitalist

attr_accessor :name, :total_worth

@@all = []

	def initialize(name, total_worth)
		@@all << self
		@name = name
		@total_worth = total_worth
	end

	def self.all
		return @@all
	end

	def self.tres_commas_club
		return @@all.select{|e| e.total_worth > 1000000000}
	end

	def offer_contract(startup, type, amount)
		FundingRound.new(type, startup, self, amount)
	end

	def funding_rounds
		FundingRound.all.select {|e| e.venture_capitalist == self}
	end

	def portfolio
		self.funding_rounds.map{|e| e.startup}.uniq
	end

	def biggest_investment
		temp = self.funding_rounds.sort{|a,b| a.investment <=> b.investment}
		return temp[0]
	end

	def invested(domain)
		temp = self.funding_rounds.select{|e| e.startup.domain == domain}
		return temp.reduce(0) {|sum, n| sum + n.investment}
	end

end