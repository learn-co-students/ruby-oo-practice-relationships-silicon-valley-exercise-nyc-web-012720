require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

superco = Startup.new("SuperCo", "Joe Smith", "Tech")
crappyco = Startup.new("CrappyCo", "Alan Smithee", "Film")
billgates = VentureCapitalist.new("Bill Gates", 47000000000)
carlosslim = VentureCapitalist.new("Carlos Slim", 51111111111)
djtrump = VentureCapitalist.new("Orange Scumbag", 20000000)

superco_investment = FundingRound.new(superco, billgates, "Angel", 40000)
superco_investment2 = FundingRound.new(superco, carlosslim, "Class A", 6000000)
superco_investment3 = FundingRound.new(superco, carlosslim, "Class B", 7000000)
superco_investment4 = FundingRound.new(superco, djtrump, "Class C", 9000000)
crappyco_investment = FundingRound.new(crappyco, carlosslim, "Class C", 8000000)


Startup.find_by_founder("Joe Smith")
Startup.domains
VentureCapitalist.tres_commas_club

binding.pry
0 #leave this here to ensure binding.pry isn't the last line