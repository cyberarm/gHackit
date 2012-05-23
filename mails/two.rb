 require 'green_shoes'
 require 'etc'
 require_relative '../lib.rb'
 
 Shoes.app do
  background '#999'
  stack do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: Greg Jefferson CTO of General Computing LLC."
  para "Hello #{Etc.getlogin},"
  para "I need your assistance to destroy our competition, Micro Computing Inc."
  para "Meltdown their computers."
  para "Here's the IP: 1.513.384.109 on Port: 21."
  para "We will pay you 10,000 Hackit credits if you succeed."
  para "Sincerly, Greg Jefferson."
  
  image "./icons/actions/mail-forward.png"
  button "Accept and Save IP/Port" do
   Mission.two
   close
  end
  button 'close' do
   load './mail.rb'
   close
  end
 end
