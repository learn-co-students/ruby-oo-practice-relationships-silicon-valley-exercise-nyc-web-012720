require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("John", "Code Rules", "wwww.CodeRule.com")
s2 = Startup.new("Tony", "Code Sucks", "wwww.CodeSucks.com")
s3 = Startup.new("Will", "Code", "wwww.Code.com")

vc1 = VentureCapitalist.new("Lots of money", 2000000)
vc2 = VentureCapitalist.new("Too much money", 2000000000)
vc3 = VentureCapitalist.new("extra money", 7000000)
vc4 = VentureCapitalist.new("No Money", 10000)
vc5 = VentureCapitalist.new("Too much money", 2000000000)

fr1 = FundingRound.new(s1, vc1, "Angel", 300000)
fr2 = FundingRound.new(s2, vc3, "Pre-seed", 2000)
fr3 = FundingRound.new(s1, vc1, "Series A", 10000)
fr4 = FundingRound.new(s3, vc4, "Series C", 93000)
fr5 = FundingRound.new(s1, vc2, "Series D", 34000)
fr6 = FundingRound.new(s2, vc2, "Series C", 890000)
fr1 = FundingRound.new(s1, vc5, "Angel", 300000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line