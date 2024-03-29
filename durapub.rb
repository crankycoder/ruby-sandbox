# Publisher for durable subscriber
# Justin Case <justin@playelite.com>

require 'ffi-rzmq'

context = ZMQ::Context.new

# Subscriber tells us when it's ready here

# We send updates via this socket
publisher = context.socket(ZMQ::PUB)
publisher.bind("tcp://127.0.0.1:5565")

# Now broadcast exactly 10 updates with pause
10.times do |update_number|
  message = sprintf("Update %d", update_number)
  publisher.send_string(message)
  sleep(1)
end
  
#publisher.send_string("END")

publisher.close
context.terminate
