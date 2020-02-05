require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


su1 = Startup.new("Rattpack", "Logic", "Rattpack.com")
su2 = Startup.new("Stark Industries", "Tony Stark", "Stark.Industries.com")
su3 = Startup.new("ASPCA", "Henry Bergh", "ASPCA.org")
su4 = Startup.new("iCarly", "Carly Shay", "iCarly.com")

vc1 = VentureCapitalist.new("Torro", 2505000000)
vc2 = VentureCapitalist.new("OnDeck", 291300000)
vc3 = VentureCapitalist.new("Lendio", 3800000000)

fund1 = FundingRound.new(su1, vc1, "Angel", 500000)
fund2 = FundingRound.new(su1, vc2, "Series B", 250000)
fund3 = FundingRound.new(su1, vc3, "Seed", 100000)
fund4 = FundingRound.new(su2, vc1, "Angel", 10000)
fund5 = FundingRound.new(su2, vc2, "Pre-Seed", 50000)
fund6 = FundingRound.new(su3, vc3, "Series B", 25000)
fund7 = FundingRound.new(su3, vc2, "Angel", 75000)
fund8 = FundingRound.new(su4, vc2, "Pre-Seed", 4000)
fund9 = FundingRound.new(su4, vc1, "Seed", 1000)
fund10 = FundingRound.new(su4, vc1, "Angel", 3000)
fund11 = FundingRound.new(su3, vc3, "Seed", 85000)

binding.pry
#leave this here to ensure binding.pry isn't the last line