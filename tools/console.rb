require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

uber = Startup.new("Uber", "Lee Mac", "Wework")
lyft = Startup.new("Lyft", "Joe Smith", "Wework")
apple = Startup.new("Apple", "Steve Jobs", "The Bat Cave")
lee = VentureCapitalist.new("LeeBee", 2000000000)
jason = VentureCapitalist.new("Jason", 1500000000)
lou = VentureCapitalist.new("Lou", 30000000)
seed_rd = FundingRound.new(uber, lee, "Seed", 10000)
seed_rd2 = FundingRound.new(lyft, jason, "Seed", -19)
series_a = FundingRound.new(apple, lee, "Series A", 300000)
series_b = FundingRound.new(uber, lou, "Series B", 25000)
uber.sign_contract(jason, "Series C", 45000)
lee.offer_contract(lyft, "Seed", 14000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line