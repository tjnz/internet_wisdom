class InternetWisdom::SiteDictionary
	
	# put all your sites and custom scraping here
	
	def self.sites 
		[
			create_funtweets,
			create_brainy_quote
		] 
	end
	
	def self.create_funtweets
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
	
	def self.create_brainy_quote
		brainy = InternetWisdom::Site.new("BrainyQuotes.com", true)
		brainy.refresh_method = Proc.new do |site|
			site.page_index = (1..39).to_a.sample
			doc = Nokogiri::HTML(open("http://www.brainyquote.com/quotes/topics/topic_funny#{site.page_index}.html"))
			site.posts = doc.search(".masonryitem").collect do |quote|
				h = {
					:author => quote.search("div.bq-aut a").text,
					:text => quote.search("span.bqQuoteLink a").text,
					:link => "http://www.brainyquote.com#{quote.search("div.bq-aut a").attribute("href").value}"
				}
				InternetWisdom::Post.new(h)
			end
		end
		brainy.refresh!
	end
	
end