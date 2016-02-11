class InternetWisdom::CLI
	
	BORDER_TOP = "------------------------"
	BORDER_BOT = "------------------------\n"
	
	attr_reader :manager, :current_post
	
	def call
		@manager = InternetWisdom::SiteManager.new
		puts "Wisdom!!!"
		get_random_wisdom
	end
	
	def get_random_wisdom
		display_post(manager.sites.sample.get_post)
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
	
	def refresh_site
	end
	
	def list_sites
	end
	
	def get_input
		input = nil
		while input != "exit"
			input = gets.strip
			case input
			when 'f'
				Launchy.open(current_post[:link]) if !current_post[:link].nil?
			when 'list'
				puts "list the items"
			when 'help'
				display_instructions
			when ""
				get_random_wisdom
			else
				puts "Command not recognized, type 'help' for instructions" if input != "exit"
			end
		end
		exit
	end
	
	def display_instructions
		puts "\nEnter 'f' to follow a link, 'list' to list sites, 'help' for help, 'exit' to quit or hit 'Enter' to get a new post"
		get_input
	end
	
end