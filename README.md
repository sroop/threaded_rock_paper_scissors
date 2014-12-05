Rock Paper Scissors
============

Description
----
##### Chapter 14, The Well Grounded Rubyist
Implementing a networked and threaded, two-player rock paper scissors game. The game waits for two people to join, stores their moves, reports the results and exits.

Exercise objectives
----
Exploring thread keys for storing thread-specific values.

How to run it
----

```sh
git clone https://github.com/sroop/threaded_rock_paper_scissors.git
cd threaded_rock_paper_scissors
ruby rps_server.rb
```
Open up a new tab and connect as the first player:

```sh
telnet localhost 3939
```

Open up another tab to connect as the second player:

```sh
telnet localhost 3939
```

Enter your moves, wait for the results!