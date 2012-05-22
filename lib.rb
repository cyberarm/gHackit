class Lib
 def Lib.gsw
  File.open('./save/save.yml', 'w')
 end

 def Lib.gsr
  File.open('./save/save.yml', 'r')
 end
 
 def Lib.main
Shoes.app do
 border gray, strokewidth: 4
 background "#444"
 title = stack padding_top:50 do
  background "#222"
  caption 'gHackit - 1.421.231.132', stroke: '#999'
 end

 flow do
  image "./icons/apps/utilities-terminal.png"
  $cmd = edit_line ""
 end
 
 messages = stack do
  para "Welcome, #{Etc.getlogin}", stroke: lime
  para "run: 'mail' to start.", stroke: lime
 end
 
 keypress do |k|
  if k == "\n"
   messages.prepend do
    if $cmd.text == ""
    else
     if $cmd.text == "exit"
      para 'Exiting...', stroke: red
      inscription
      timer 1.3 do
       exit
      end
      
     elsif $cmd.text == 'help'
      para "Help:", stroke: lime
       para "mail - Check for new missions.", stroke: lime
       para "about - displays information about gHackit", stroke: lime
       para "exit - Exit gHackit.", stroke: lime
      inscription
      
     elsif $cmd.text == 'about'
      para "gHackit is a game by:" 
      para link('cyberarm', click: 'https://github.com/cyberarm')
      inscription
      
     elsif $cmd.text == 'mail'
      load './mail.rb'
      timer 1 do
       close
      end
      inscription
      
     else
      para "Command '#{$cmd.text}' not found.\n Type 'help' for a list of commands", stroke: red
      inscription
     end
      $cmd.text = ""
    end
   end
  end
 end
end 
 end
end

class Mission
 def self.one
  load './missions/1.rb'
 end
 def self.two
  load './missions/2.rb'
 end
 def self.three
  load './missions/3.rb'
 end
end
