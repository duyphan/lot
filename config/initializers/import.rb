scheduler = Rufus::Scheduler.new

scheduler.cron '00 0 23 * * 1-5' do
# scheduler.every("1m") do
	puts "Run"
  time = Benchmark.measure do
		import = Import.new
		
		import.delay.action
	end
	puts time
	puts "End"
end
