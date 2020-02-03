require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

a = VentureCapitalist.new("Super Ventures", 1200000000)
b = VentureCapitalist.new("Gangasta Ventures", 1800000000)
c = VentureCapitalist.new("German Ventures", 800000000)
d = VentureCapitalist.new("Summer Ventures", 1800000000)


tesla = Startup.new("Tesla", "Elon Musk", "Cars")
google = Startup.new("google", "Larry and Sergei", "Search")
facebook = Startup.new("facebook", "Zuck", "Social")

tesla.sign_contract(a, "Series A", 100000000)
google.sign_contract(a, "Series B", 400000000)
facebook.sign_contract(a, "Series C", 30000000)

tesla.sign_contract(b, "Series A", 300000000)
google.sign_contract(b, "Series B", 200000000)
facebook.sign_contract(b, "Series C", 10000000)

tesla.sign_contract(c, "Series A", 20000000)
google.sign_contract(c, "Series B", 20000000)
facebook.sign_contract(c, "Series C", 200000000)

tesla.sign_contract(d, "Series A", 9000000)
google.sign_contract(d, "Series B", 8000000)
facebook.sign_contract(d, "Series C", 38000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line