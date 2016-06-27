class InternetWisdom::SiteManager
	
	attr_accessor :sites
	
	def initialize
		@sites = []
		#uncomment debug_scrape to use Nokogiri in development
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
		@sites = InternetWisdom::SiteDictionary.sites
	end
	
end