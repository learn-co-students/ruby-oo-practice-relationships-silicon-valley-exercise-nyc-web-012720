require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

kelly = Startup.new("Penguins", "Kelly", "Northpole")
joey = Startup.new("Seals", "Joey", "Ocean")

john = VentureCapitalist.new("John", 3000000000000)
april = VentureCapitalist.new("April", 1500000000000)

round1 = FundingRound.new("PreSeed", 3000.00, kelly, april)
round2 = FundingRound.new("Series B", 18000.00, joey, john)
round3 = FundingRound.new("SeriesA", 1000.00, kelly, john)
round4 = FundingRound.new("SeriesB", 500.00, kelly, april)
round5 = FundingRound.new("SeriesC", 700.00, joey, john)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line