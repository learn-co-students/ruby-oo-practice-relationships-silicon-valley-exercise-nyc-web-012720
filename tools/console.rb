require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Start-ups
pear = Startup.new("Pear", "Steve Bobs", "pear.com")
wework = Startup.new("wework", "Lebron James", "wee.com")
car_company = Startup.new("ZoomZoom", "Leonardo DaVinci", "fast.com")
#Venture Caps
money = VentureCapitalist.new("Ricky", 2000000)
more_money = VentureCapitalist.new("Steve", 4000000)
even_more = VentureCapitalist.new("Adit", 8000000)
less_money = VentureCapitalist.new("Gabi", 50000)
even_less = VentureCapitalist.new("Mahommes", 30000)
#---
# pear_angel = FundingRound.new(pear, more_money, "Angel", 2000000)
# pear_pre_seed = FundingRound.new(pear, even_more, "Pre-Seed", 3000000)
# car_company_angel = FundingRound.new(car_company, less_money, "Angel", 4000)
#---
#Startup asks for money
plz = pear.sign_contract(more_money, "Angel", 500000)
plz2 = pear.sign_contract(more_money, "Pre-Seed", 60000)
plz3 = pear.sign_contract(money, "Seed", 90000)
plz4 = pear.sign_contract(even_less, "Series A", 800)
#----tests----
hi = pear.num_funding_rounds
hello = pear.total_funds
cool = pear.investors
awesome = pear.big_investors
#----Startup Tests----
#VC offers money
payme = money.offer_contract(wework, "Angel", 100000)
payme2 = money.offer_contract(wework, "Pre-Seed", 30000)
payme3 = more_money.offer_contract(wework, "Angel", 100000)
#---
#----VC Tests----
go = money.funding_rounds
go1 = money.portfolio
go2 = money.biggest_investment
go3 = money.invested("wee.com")
binding.pry

0 #leave this here to ensure binding.pry isn't the last line