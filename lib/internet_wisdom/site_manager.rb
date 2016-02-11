class InternetWisdom::SiteManager
	
	attr_accessor :sites
	
	def initialize
		@sites = []
		puts "NEW MANAGER"
		#debug_scrape
		create_sites
	end
	
	def debug_scrape
		puts "DEBUG MODE: Enter a url you wish to scrape"
		url = gets.strip
		doc = Nokogiri::HTML(open(url))
		binding.pry
	end
	
	def create_sites
		sites << create_funtweets
	end
	
	def create_funtweets
		puts "create_funtweets"
		funtweets = InternetWisdom::Site.new("FunTweets.com", true)
		funtweets.refresh_method = Proc.new do |site|
			doc = Nokogiri::HTML(open("http://funtweets.com/random"))
			site.posts = doc.search(".tweet").collect do |tweet|
				arr = tweet.search(".tweet-text").text.delete("\r\t").split("\n")
				h = {
					:author => arr[1].strip,
					:text => arr[2].strip,
					:link => "https://twitter.com/#{arr[1].strip}"
				}
				InternetWisdom::Post.new(h)
			end
		end
		funtweets.refresh!
	end
	
	def create_cool_funny_quotes
	end
	
	def refresh_site(site)
		site.refresh! 
	end
	
	
end