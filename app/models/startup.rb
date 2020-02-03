class Startup

attr_accessor :name
attr_reader :founder, :domain

@@all = []

	def initialize(name, founder, domain)
		@@all << self
		@name = name
		@founder = founder
		@domain = domain
	end

	def pivot(domain, name)
		@name = name
		@domain = domain
	end

	def self.all
		return @@all
	end

	def self.find_by_founder(founder)
		return @@all.find { |e| e.founder == founder}
	end

	def self.domains
		domains = []
		@@all.each {|e| domains << e.domain}
		return domains
	end

	def sign_contract(venture_capitalist, type, amount)
		FundingRound.new(type, self, venture_capitalist, amount)
	end

	def funding_rounds
		FundingRound.all.select {|e| e.startup == self}
	end

	def num_funding_rounds
		result = self.funding_rounds.map {|e| e.type}
		return result.uniq.length
	end

	def total_funds
		result = self.funding_rounds.reduce(0) {|sum, n| n.investment + sum}
		return result
	end

	def investors
		result = self.funding_rounds.map {|e| e.venture_capitalist}
		return result.uniq
	end

	def big_investors
		self.investors & VentureCapitalist.tres_commas_club
	end


end