 require 'green_shoes'
 require 'etc'
 
 Shoes.app title: 'gHackit - Message' do
  background '#999'
  stack do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  para "Message from: Greg Jefferson CTO of General Computing LLC."
  para "Hello #{Etc.getlogin},"
  para "We thank you for destroying, Micro Computing Inc,"
  para "it will be sometime before their competition again."
  para "Your payment as promised: 10,000 Hackit credits."
  para "Sincerly, Greg Jefferson."
  
  image "./icons/actions/mail-forward.png"
  button 'close and receive credits' do
   load './mail.rb'
   close
  end
 end
