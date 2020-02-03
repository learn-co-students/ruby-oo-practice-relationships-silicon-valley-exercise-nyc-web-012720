require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
google=Startup.new("Google","Serg","SF")
amazon=Startup.new("Amazon","Bezoz","SE")
apple=Startup.new("Apple","Jobs","SF")


flatiron=VentureCapitalist.new("Flatiron",10000000)
appAcademy=VentureCapitalist.new("AA",108000000)
fullStack=VentureCapitalist.new("Fullstack",1000000000000)




sequoia=FundingRound.new(google,flatiron,"Series B",-111111.123)
sequoia1=FundingRound.new(google,flatiron,"Series B",11000000.123)


forbes=FundingRound.new(amazon,appAcademy,"Series C",50000)

gvm=FundingRound.new(apple,fullStack,"Series D",50000.101)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line