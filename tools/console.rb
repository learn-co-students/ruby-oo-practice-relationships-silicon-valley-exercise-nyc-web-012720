require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

tesla = Startup.new("Tesla","Elon Musk","tesla.com")
facebook = Startup.new("Facebook","Mark Zuckerberg","facebook.com")
snapchat = Startup.new("Snapchat","Evan Spiegel","snapchat.com")

snapchat.pivot("www.snapchat.com","Snapchat, Inc.")
Startup.all 
Startup.domains

sequoia = VentureCapitalist.new("Sequoia Capital",1400000000000)
accel = VentureCapitalist.new("Accel",4600000000)
some_vc = VentureCapitalist.new("Some VC",12000000)

tcc = VentureCapitalist.tres_commas_club

tesla_angel = FundingRound.new(tesla,sequoia,"Angel",99000000)
snapchat_seed = FundingRound.new(snapchat,accel,"Seed",32000000)
facebook_a = FundingRound.new(facebook,some_vc,"Series A",12000000)
facebook_b = FundingRound.new(facebook,sequoia,"Series B",1000000000)

sequoia.offer_contract(snapchat,"Series A",1000000)
tesla.sign_contract(sequoia,"Pre-Seed",20000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line