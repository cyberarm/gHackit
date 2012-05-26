 require 'green_shoes'
 require 'etc'
 
 Shoes.app title: 'gHackit - Message' do
  background '#999'
  stack do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: John Gates, CEO of Sports auto Inc."
  para "Hello #{Etc.getlogin},"
  para "I need your assistance to destroy our competition, Inventia."
  para "Steal their design for the G3X car, then remove all traces of the G3X from their computers."
  para "Here's the IP: 9.4.1.22 on Port: 510."
  para "We will pay you 100,000 Hackit credits if you succeed."
  para "Sincerly, John Gates."
  
  image "./icons/actions/mail-forward.png"
  button 'close and save IP/Port' do
   Mission.three
   close
  end
  button 'close' do
   load './mail.rb'
   close
  end
 end
