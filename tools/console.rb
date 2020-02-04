require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("apple", "steve", "computers")
startup2 = Startup.new("facebook", "mark", "social media")
startup3 = Startup.new("microsoft", "bill", "computers")
startup4 = Startup.new("amazon", "jeff", "shopping")
startup5 = Startup.new("profoco", "john", "computers")

vc1 = VentureCapitalist.new("James", 100)
vc2 = VentureCapitalist.new("Joe", 70000000)
vc3 = VentureCapitalist.new("Sally", 1000000000)
vc4 = VentureCapitalist.new("Jess", 1000000001)
vc5 = VentureCapitalist.new("Frank", 9999999999999999)

fund1 = FundingRound.new(startup5, vc1, "Angel", 30000.00)
fund2 = FundingRound.new(startup4, vc1, "Pre-Seed", 40000.00)
fund3 = FundingRound.new(startup3, vc1, "Series-A", 50000.00)
fund4 = FundingRound.new(startup2, vc1, "Series-B", 60000.00)
fund5 = FundingRound.new(startup1, vc5, "Series-C", 70000.00)








binding.pry
0 #leave this here to ensure binding.pry isn't the last line