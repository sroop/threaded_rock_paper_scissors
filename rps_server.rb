require 'socket'
require_relative 'rps_logic'
s = TCPServer.new(3939) # start with a server
threads = [] # an array to store the threads
2.times do |n| # gather only two threads for a 2 player game (not an infinite loop like with the chat server)
  conn = s.accept
  threads << Thread.new(conn) do |c| # create a thread for each connection
    Thread.current[:number] = n + 1 # store a number value in the threads key :number
    Thread.current[:player] = c # store a player in the :player key
    c.puts "Welcome, player #{n+1}!"
    c.print "Your move? (rock, paper, scissors): "
    Thread.current[:move] = c.gets.chomp # store the players move in the threads key :move
    c.puts "Thanks... hang on."
  end
end
a,b = threads # assign a variable to each players thread
a.join # ensure that each thread finishes before instantiating the RPS objects
b.join
rps1, rps2 = Games::RPS.new(a[:move]), Games::RPS.new(b[:move]) # create two RPS objects that contain a memory of the players moves
winner = rps1.play(rps2) # the winner is determined by playing them against each other
if winner
  result = winner.move
else
  result = "TIES!"
end
threads.each do |t|
  t[:player].puts "The winner is #{result}!" # report the results to both players
end