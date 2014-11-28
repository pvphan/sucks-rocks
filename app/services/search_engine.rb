class SearchEngine
	def self.count_results(query)
		OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
		bing = Bing.new("Y9+OujW8Z1He5oFqjTQsU6FPb3CnX/BpXEGnKVZLv+o", 100, 'Web')
		bing_results = bing.search(query, 100)
	end
end