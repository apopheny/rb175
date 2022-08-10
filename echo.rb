require 'socket'

server = TCPServer.new('localhost', 3001)

def parse_request(request_line)
  method = request_line.scan(/(^\w+)/)[0][0]
  path = request_line.scan(/(\/\w*\/*)+\?/)[0][0]
  params = request_line.scan(/\?*(\w+)=(\d+)/).to_h

  [method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if (!request_line || request_line =~ /favicon/)
  puts request_line

  method, path, params = parse_request(request_line)
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<!DOCTYPE html>"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<h1>Dice Roller</h1>"
  client.puts "<p>Method: <strong>#{method}</strong></p><p>Path: <strong>#{path}</strong></p><p>Params: <strong>#{params}</strong></p>"
  
  rolls = params['rolls'].to_i
  sides = params['sides'].to_i
  1.upto(rolls) { |turn| client.puts "<p>Roll #{turn} is #{rand(sides) + 1}</p>" }
  
  client.puts "</body>"
  client.puts "</html>"
  client.close
end