require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new()
startup1.name = "flatrion"
startup1.founder = "Avi"
startup1.domain = "school"
startup1.pivot("hospital", "doock")

startup2 = Startup.new()
startup2.name = "puppy"
startup2.founder = "Steven"
startup2.domain = "puppySchool"

venturecapitalist1 = VentureCapitalist.new("puppy", 1000)
venturecapitalist2 = VentureCapitalist.new("bob", 2000)

funding_round1 = FundingRound.new(startup1,venturecapitalist1,"Series A", 1000000)
funding_round2 = FundingRound.new(startup2,venturecapitalist2,"Series B", 2000000)
funding_round2 = FundingRound.new(startup2,venturecapitalist2,"Series A", 4000000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line