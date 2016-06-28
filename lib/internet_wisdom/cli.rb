class InternetWisdom::CLI
	
	BORDER = "~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
	WELCOME = "\nWELCOME TO INTERNET WISDOM!!!"
	INSTRUCTIONS = %q(
	Hotkeys:
	 h - help
	 f - follow the author on the web
	 x - filter posts from a specific site
	 [Enter] - get a new post
	 q - quit
	)
	
	attr_reader :manager, :current_post, :cur_site, :cur_site_index
	
	def call
		puts WELCOME
		puts INSTRUCTIONS
		
		@manager = InternetWisdom::SiteManager.new
		@cur_site_index = -1
		puts "\n"
		get_wisdom
	end
	
	def get_wisdom
		cur_site_index < 0 ? @cur_site = manager.sites.sample : @cur_site =  manager.sites[cur_site_index]
		display_post(cur_site.get_post)
	end
	
	def display_post(post)
		puts BORDER 
		@current_post = post.hash
		post.hash.each do |k, v|
			puts "#{v}\n\n"
		end
		puts BORDER 
		get_input
	end
	
	def filter_sites
		puts "\nEnter a number below to only get wisdom from a specific source"
		puts "0. Randomly select wisdom from all sites (default)"
		manager.sites.each.with_index(1) { |s, i| puts "#{i}. #{s.name}" }
		input = gets.strip.to_i
		if input >= 0 && input <= manager.sites.length
			@cur_site_index = input - 1
			puts "\n"
			input < 1 ? (puts "Fetching wisdom from randomly chosen sites") : (puts "Fetching wisdom from #{manager.sites[cur_site_index].name}") 
			get_wisdom
		else
			puts "Invalid entry, try again"
			filter_sites
		end
	end
	
	def get_input
		input = nil
		while input != 'q'
			input = gets.strip
			case input
			when 'f'
				Launchy.open(current_post[:link]) if !current_post[:link].nil?
			when 'x'
				filter_sites
			when 'h'
				display_instructions
			when ""
				get_wisdom
			else
				puts "Command not recognized, type 'h' for instructions" if input != "q"
			end
		end
		puts "\n\nGoodbye!!"
		exit
	end
	
	def display_instructions
		puts WELCOME
		puts INSTRUCTIONS
		get_input
	end
	
end