# Durable subscriber
# Justin Case <justin@playelite.com>

require 'ffi-rzmq'

context = ZMQ::Context.new

# Connect our subscriber socket
subscriber = context.socket(ZMQ::SUB)
subscriber.setsockopt(ZMQ::IDENTITY, "Hello")
subscriber.setsockopt(ZMQ::SUBSCRIBE, "")
subscriber.connect("tcp://127.0.0.1:5565")

# Get updates, exit when told to do so
loop do
  message = subscriber.recv_string
  puts message
  if message == "END"
    break
  end
end
