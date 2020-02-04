require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

apple = Startup.new("Apple Computers", "Steve Jobs", "www.apple.com")
uber = Startup.new("Uber Computers", "Robert DeNiro", "www.uber.com")

musk = VentureCapitalist.new("Elon Musk", 30398473287)
besos = VentureCapitalist.new("Jeff Besos", 105883377489)
mcmahon = VentureCapitalist.new("Vince McMahon", 21903479)

apple.sign_contract(musk, "Series A", 449999.05)
apple.sign_contract(mcmahon, "Angel", 344299.45)
apple.sign_contract(besos, "Seed", 94470.80)

uber.sign_contract(besos, "pre-seed", 500.00)
uber.sign_contract(musk, "Series B", 3999990.00)

apple.big_investors


binding.pry


0 #leave this here to ensure binding.pry isn't the last line