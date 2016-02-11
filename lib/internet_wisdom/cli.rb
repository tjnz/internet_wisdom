class InternetWisdom::CLI
	
	BORDER_TOP = "------------------------"
	BORDER_BOT = "------------------------\n"
	INSTRUCTIONS = "Type 'f' to follow a link, 'filter' to apply a site filter, 'help' for help, 'exit' to quit or press 'Enter' to get a new post\n"
	
	attr_reader :manager, :current_post, :cur_site, :cur_site_index
	
	def call
		@manager = InternetWisdom::SiteManager.new
		@cur_site_index = -1
		puts "\nWELCOME TO INTERNET WISDOM!!!"
		puts INSTRUCTIONS
		get_wisdom
	end
	
	def get_wisdom
		cur_site_index < 0 ? @cur_site = manager.sites.sample : @cur_site =  manager.sites[cur_site_index]
		display_post(cur_site.get_post)
	end
	
	def display_post(post)
		puts BORDER_TOP
		@current_post = post.hash
		post.hash.each do |k, v|
			puts "#{v}"
		end
		puts BORDER_BOT
		get_input
	end
	
	def filter_sites
		puts "\nEnter a number below to apply a site filter"
		puts "0. Randomly selects a site (default)"
		manager.sites.each.with_index(1) { |s, i| puts "#{i}. #{s.name}" }
		input = gets.strip.to_i
		if input >= 0 && input <= manager.sites.length
			@cur_site_index = input - 1
			puts "\n"
			input < 1 ? (puts "Choosing wisdom from randomly chosen sites") : (puts "Choosing wisdom from #{manager.sites[cur_site_index].name}") 
			get_wisdom
		else
			puts "Invalid entry, try again"
			list_sites
		end
	end
	
	def get_input
		input = nil
		while input != "exit"
			input = gets.strip
			case input
			when 'f'
				Launchy.open(current_post[:link]) if !current_post[:link].nil?
			when 'filter'
				filter_sites
			when 'help'
				display_instructions
			when ""
				get_wisdom
			else
				puts "Command not recognized, type 'help' for instructions" if input != "exit"
			end
		end
		puts "Goodbye"
		exit
	end
	
	def display_instructions
		puts INSTRUCTIONS
		get_input
	end
	
end