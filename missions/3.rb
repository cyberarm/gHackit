require 'green_shoes'
require 'etc'

$tools = false
$pc2   = false
$files = %w{blueprint-G3X.otd test-g3x.blend AD-G3X.svg CarShow-demo_G3X.txt}

puts 'loading MissionThree'
Shoes.app title: 'gHackit - Mission Three: G3X theft' do
puts 'loaded MissionThree'
 background '#999'
 flow do
  background "#222"
  caption 'gHackit - 1.421.231.132', stroke: '#999'
 end
 flow do
  background 'red'
  para "Mission Three: G3X theft."
 end
  button 'Message' do
   window do
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
    button 'close' do
     close
   end
  end
  button 'cancel' do
   Lib.main
   close
  end
 end
 flow do
  image "./icons/apps/utilities-terminal.png"
  $cmd = edit_line ""
  $cmd.focus
 end
 messages = stack do
  para 'We will need a tool, FileCopier4.91'
  para 'fetch it with: retrieve_tools'
 end
 
  keypress do |k|
  if k == "\n"
   messages.prepend do
    if $cmd.text == ""
    else
     if $cmd.text == "exit"
      para 'Exiting...', stroke: red
      inscription
      timer 1 do
       exit
      end
      
     elsif $cmd.text == 'retrieve_tools'
      timer 4 do
       messages.prepend {para 'retrieving tool: FileCopier4.91'}
      end
      timer 3 do
       messages.prepend {para 'connected to server. starting download...', stroke: lime}
      end
      timer 1 do
       messages.prepend {para 'connecting to programs server...'}
      end
      timer 5 do
       messages.prepend {para 'downloading FileCopier4.91... please wait'}
      end
      timer 8 do
       messages.prepend {para 'downloaded FileCopier4.91'}
       messages.prepend {para 'installing FileCopier4.91'}
       messages.prepend {para "run: 'portcrack' to start attack.", stroke: lime}
       $tools = true
      end
      inscription
      
     elsif $cmd.text == 'help'
      para 'retrieve_tools - retrieve tools required for mission.'
      para 'exit - close gHackit.'
      para 'program - delete all files.'
      para "portcrack - hack into the manufactures computer system."
      inscription
      
     elsif $cmd.text == 'portcrack'
      if $tools == true
       para 'starting attack against: IP: 9.4.1.22 on Port: 510.'
       pro = para 'progress: 0%'
       timer 5 do
        pro.text = 'progress: 25%'
       end
       timer 9 do
        pro.text = 'progress: 50%'
       end
       timer 12 do
        pro.text = 'progress: 75%'
       end
       timer 16 do
        pro.text = 'progress: 100%'
        messages.prepend {para "run: 'cp -a' to Copy all files.", stroke: lime}
        $pc2 = true
       end
      else
       para 'Error: not all required files installed, try: \'retrieve_tools\'.', stroke: darkred
      end
      inscription
      
     elsif $cmd.text == 'ls'
      if $pc2
       para 'Files:'
       $files.each do |f|
       inscription f
       end
      else
       para 'Error: not connected to file server.', stroke: darkred
      end
      inscription
      
     elsif $cmd.text == 'cp -a'
      if $pc2 == true
       para 'Running FileCopier4.91, getting file list...'
       $files.each do |f|
        timer 3 do
        messages.prepend {inscription 'copied: ' + f}
         end
        end
        timer 4 do
         messages.prepend {para 'Run: \'massdelete\' to remove all files.', stroke: lime}
        end
       $cp = true
      else
       para 'Error: not connected to file server.', stroke: darkred
      end
      inscription

     elsif $cmd.text == 'massdelete'
     if $cp == true
      para 'Running MassDeletion5...'
      $files.each do |f|
        timer 3 do
         messages.prepend {inscription 'Deleted: ' + f}
       end
       timer 5 do
        @mission = {"mission" => 3}
        Lib.gsw.puts YAML.dump(@mission)
        require_relative '../mails/three_complete.rb'
        #close # crashes game :(
       end
      end
     else
      para 'Error: \'cp -a\' has not been run.', stroke: darkred
     end
     inscription
      
     else
      para "Command '#{$cmd.text}' not found.\n Type 'help' for a list of commands", stroke: darkred
      inscription
     end
      $cmd.text = ""
    end
   end
  end
 end
end

#@mission = {"mission" => 3}
#Lib.gsw.puts YAML.dump(@mission)

