 require 'green_shoes'
 require 'etc'
 
 Shoes.app do
  stack do
   background '#222'
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: Sid Olson of Advanced Computing Inc."
  para "Hello #{Etc.getlogin},"
  para "Thank You very much for your assistance."
  para "Here's a symbol of our appreciation, 1000 Hackit credits."
  para "Sincerly, Sid Olson."
  button 'close and receive credits' do
   load './mail.rb'
   close
  end
 end
