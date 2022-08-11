require 'socket'

server = TCPServer.new('localhost', 3003)

def parse_request(request_line)
  method = request_line.scan(/(^\w+)/)[0][0]
  path = request_line.scan(/GET\s(\/[^?\s]*)/)[0][0]
  params = request_line.include?('?') ? \
    request_line.scan(/\?*(\w+)=(\d+)/).to_h : ''
  
  [method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if (!request_line || request_line =~ /favicon/)
  puts request_line
  next unless request_line

  method, path, params = parse_request(request_line)
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<!DOCTYPE html>"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  
  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i

  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='?number=#{number + 1}'>Increment by 1</a> " \
    "<a href='?number=#{number - 1}'>Decrement by 1</a>"

  client.puts "</pre>"
  client.puts "</body>"
  client.puts "</html>"
  client.close
end