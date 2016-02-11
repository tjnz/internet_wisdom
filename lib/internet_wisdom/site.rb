class InternetWisdom::Site
	
	attr_accessor :name, :posts, :is_random, :refresh_method
	attr_reader :cur_index
	
	def initialize(name, israndom=false)
		@name = name
		@is_random = israndom
		@cur_index = 0
	end
	
	def get_post
		if cur_index >= posts.length
			is_random ? refresh! : @cur_index = 0
		end
		@cur_index += 1
		posts[cur_index - 1]
	end
	
	def refresh!
		puts "#{name} refreshing!"
		refresh_method.call(self)
		@cur_index = 0
		self
	end
	
end