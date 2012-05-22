 require 'green_shoes'
 require 'etc'
 require_relative '../lib.rb'
 
 Shoes.app do
  stack do
   background '#222'
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: Sid Olson of Advanced Computing Inc."
  para "Hello #{Etc.getlogin},"
  para "We need your assistance to destroy our latest project gone bad."
  para "Our Digital Life Assistant project has gone rogue,"
  para "please destroy it before it empty's our bank account."
  para "Here's the IP: 1.7.3.9 on Port: 576."
  para "We will pay you 1000 Hackit credits if you succeed."
  para "Sincerly, Sid Olson."
  button "Accept and Save IP/Port" do
   Mission.one
   close
  end
  button 'close' do
   load './mail.rb'
   close
  end
 end
