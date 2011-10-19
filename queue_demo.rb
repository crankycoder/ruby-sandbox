require 'thread'

queue = Queue.new

producer = Thread.new do
  100.times do |i|
    sleep rand # simulate expense
    queue << i
    puts "#{i} produced\n"
  end
end

consumer = Thread.new do
  100.times do |i|
    value = queue.pop
    sleep rand # simulate expense
    puts "consumed #{value}\n"
  end
end

consumer.join
