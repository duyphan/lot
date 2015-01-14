require 'activerecord-import'
namespace :import do
	desc "Importing lotteries from rss ..."
	task :lotteries, [] => :environment do

		time = Benchmark.measure do
			import = Import.new
			import.action
		end
		puts time
	end
end