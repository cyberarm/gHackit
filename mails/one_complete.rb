 require 'green_shoes'
 require 'etc'
 
 Shoes.app title: 'gHackit - Message' do
  background '#999'
  stack do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: Sid Olson of Advanced Computing Inc."
  para "Hello #{Etc.getlogin},"
  para "Thank You very much for your assistance."
  para "Here's a symbol of our appreciation, 1000 Hackit credits."
  para "Sincerly, Sid Olson."
  
  image "./icons/actions/mail-forward.png"
  button 'close and receive credits' do
   load './mail.rb'
   close
  end
 end
