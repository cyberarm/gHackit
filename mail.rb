require 'green_shoes'
require 'yaml'
require_relative 'lib.rb'

 save = YAML.load(Lib.gsr.read)

begin 
if File.open(Lib.gsr).read.include?('mission') == false
 Shoes.app title: 'gHackit - Mail' do
  background '#888'
  flow do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  stack do
   background '#999'
   image "./icons/actions/mail-message-new.png"
   para 'Help!' 
   button 'read' do
    load './mails/one.rb'
    close
   end
  end
  button 'Refresh' do
   load './mail.rb'
   close
  end
 button 'Close Mail' do
  Lib.main
  close 
 end
end
  
elsif save['mission'] == 1
 Shoes.app title: 'gHackit - Mail' do
  background '#888'
  flow do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  flow do
   background '#999'
   para 'Destroy Micro Computing Inc.'
   image "./icons/actions/mail-message-new.png"
   button 'read' do
    load './mails/two.rb'
    close
   end
  end
  stack do
   background '#666'
   para 'Thank you' 
   button 'read' do
    load './mails/one_complete.rb'
    close
   end
  end
  stack do
   background '#999'
   para 'Help!' 
   button 'read' do
    load './mails/one.rb'
    close
   end
  end
  button 'Refresh' do
   load './mail.rb'
   close
  end
 button 'Close Mail' do
  Lib.main
  close 
 end
 end
 
elsif save['mission'] == 2
Shoes.app title: 'gHackit - Mail' do
  background '#888'
  flow do
   background '#222'
   image "./icons/apps/internet-mail.png"
   caption 'HackitMail', stroke: '#999'
  end
  flow do
   background '#999'
   para 'Get me the designs for the G3X'
   image "./icons/actions/mail-message-new.png"
   button 'read' do
    load './mails/three.rb'
    close
   end
  end
  flow do
   background '#666'
   para 'Thank You'
   button 'read' do
    load './mails/two_complete.rb'
    close
   end
  end
  flow do
   background '#999'
   para 'Destroy Micro Computing Inc.'
   button 'read' do
    load './mails/two.rb'
    close
   end
  end
  stack do
   background '#666'
   para 'Thank you' 
   button 'read' do
    load './mails/one_complete.rb'
    close
   end
  end
  stack do
   background '#999'
   para 'Help!' 
   button 'read' do
    load './mails/one.rb'
    close
   end
  end
  button 'Refresh' do
   load './mail.rb'
   close
  end
 button 'Close Mail' do
  Lib.main
  close 
 end
 end
 
elsif save['mission'] == 3
 load './missions/complete.rb'
 
else
 puts 'problem with loading Mail.'
end
rescue NoMethodError
 load './mail.rb'
end
