require 'green_shoes'
require 'yaml'
require_relative 'lib.rb'

 save = YAML.load(Lib.gsr.read)

if File.open(Lib.gsr).include?('mission') == false
 Shoes.app do
  flow do
   background '#222'
   image "./icons/actions/mail-message-new.png"
   caption 'HackitMail', stroke: '#999'
  end
  stack do
   background '#999'
   para 'Help!' 
   button 'read' do
    require_relative 'mails/one.rb'
    close
   end
  end
 end
  
elsif save['mission'] == 1
 require './missions/2.rb'
 puts "Mission Two"
 
elsif save['mission'] == 2
 require './missions/3.rb'
 puts "Mission Three"
 
elsif save['mission'] == 3
 require './missions/complete.rb'
 
else
 puts 'problem.'
end
