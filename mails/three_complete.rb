 require 'green_shoes'
 require 'etc'
 
 Shoes.app do
  background '#999'
  stack do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: John Gates, CEO of Sports auto Inc."
  para "Thank You #{Etc.getlogin},"
  para "We can now take credit for thie- our creation."
  para "Here is you payment of100,000 Hackit credits,don't spend it all in one place (seriously)."
  para "Sincerly, John Gates."
  
  image "./icons/actions/mail-forward.png"
  button 'close and receive credits' do
   load './mail.rb'
   close
  end
 end
