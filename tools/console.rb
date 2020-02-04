require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

apple = Startup.new("Apple", "Steve Jobs", "www.apple.com")
snapchat = Startup.new("Snapchat", "Evan Spiegel", "www.snapchat.com")
facebook = Startup.new("Facebook", "Mark Zuckerberg", "www.facebook.com")

ricky = VentureCapitalist.new("Ricky", 1000002)
halton = VentureCapitalist.new("Halton", 999999)
adit = VentureCapitalist.new("Adit", 9999999)

# angel = FundingRound.new(apple, ricky, "Angel", 1000000)
# pre_seed = FundingRound.new(apple, halton, "Pre-Seed", 2000000)
# angel = FundingRound.new(snapchat, ricky, "Angel", 5000000)
# pre_seed = FundingRound.new(snapchat, halton, "Pre-Seed", 7000000)

yo = apple.sign_contract(ricky, "Angel", 500)
yoo = apple.sign_contract(ricky, "Angel", 600)
yooo = apple.sign_contract(halton, "Series A", 700)

hi = ricky.offer_contract(apple, "Angel", 123)
hii = ricky.offer_contract(apple, "Angel", 124)
hiii = ricky.offer_contract(snapchat, "Angel", 1240)
gucci = ricky.biggest_investment
hu = ricky.invested("www.apple.com")


binding.pry

0 #leave this here to ensure binding.pry isn't the last line