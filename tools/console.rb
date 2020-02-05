require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

st1 = Startup.new("Facebook","Mark","social media")
st2 = Startup.new("Twitter","Steve","social media")
st3 = Startup.new("Instagram","Henry","social media")

vc1 = VentureCapitalist.new("Josh", 1500000000)
vc2 = VentureCapitalist.new("Dude", 900000000)
vc3 = VentureCapitalist.new("John", 1100000000)

fr1 = FundingRound.new(vc1, st1, "Angel", 100000)
fr2 = FundingRound.new(vc2, st2, "Pre-Seed", 50000)
fr3 = FundingRound.new(vc3, st3, "Series A", 110000)
fr4 = FundingRound.new(vc1, st1, "Series B", 200000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line