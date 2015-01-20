require 'activerecord-import'
namespace :import do
	desc "Importing lotteries from rss ..."
	task :lotteries, [] => :environment do

		time = Benchmark.measure do
			import = Import.new

			puts "Run background"
			
			import.delay.action
		end
		puts time
	end
end