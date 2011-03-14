task :step, :n do |t, args|
  max_step = args[:n].to_i
  tags = (1..max_step).map { |i| "@step#{i}" }.join ','
  system "cucumber --tags #{tags}"
end

