require 'green_shoes'
require 'etc'
require_relative '../lib.rb'

puts 'loading MissionOne'

$tools = false
$pc2 = false

Shoes.app title: 'gHackit - Mission One: Rogue A.I.' do
puts 'loaded MissionOne'
 background '#999'
 flow do
  background "#222"
  caption 'gHackit - 1.421.231.132', stroke: '#999'
 end
 flow do
  background 'gold'
  para 'Mission One: Rogue A.I.'
  button 'Message' do
   window do
    background '#999'
    stack do
     background '#222'
     image "./icons/apps/internet-mail.png"
     caption 'HackitMail', stroke: '#999'
    end
    para "Message from: Sid Olson of Advanced Computing Inc."
    para "Hello #{Etc.getlogin},"
    para "We need your assistance to destroy our latest project gone bad."
    para "Our Digital Life Assistant project has gone rogue,"
    para "please destroy it before it empty's our bank account."
     para "Here's the IP: 1.7.3.9 on Port: 576."
    para "Sincerly, Sid Olson."
    button 'close' do
     close
    end
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
  para 'We will need some tools, MassDeletion5 and PortCrack2'
  para 'fetch them with: retrieve_tools'
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
      
     elsif $cmd.text == 'retrieve_tools'
      para 'downloading MassDeletion5... please wait'
      para 'retrieving tools: MassDeletion5 and PortCrack2'
      timer 10 do
       messages.prepend {para 'downloaded MassDeletion5'}
       messages.prepend {para 'downloading PortCrack2... please wait'}
      end
      timer 20 do
       messages.prepend {para 'downloaded PortCrack2'}
       messages.prepend {para 'installing MassDeletion5'}
       messages.prepend {para 'installing PortCrack2'}
       messages.prepend {para "run: 'portcrack' to start attack.", stroke: lime}
       $tools = true
      end
      inscription
      
     elsif $cmd.text == 'help'
      para 'retrieve_tools - retrieve tools required for mission.'
      para 'exit - close gHackit.'
      para 'massdelete - delete all files.'
      para "portcrack - hack into the A.I's computer system."
      inscription
      
     elsif $cmd.text == 'portcrack'
      if $tools == true
       para 'starting attack against: IP: 1.7.3.9 on Port: 576.'
       pro = para 'progress: 0%'
       timer 7 do
        pro.text = 'progress: 50%'
       end
       timer 14 do
        pro.text = 'progress: 100%'
        messages.prepend {para "run: 'massdelete' to delete all system files.", stroke: lime}
        $pc2 = true
       end
      else
       para "Command '#{$cmd.text}' not found.\n Type 'help' for a list of commands", stroke: red
      end
      inscription
      
     elsif $cmd.text == 'massdelete'
      if $pc2 == true
      timer 22 do
       messages.prepend {para 'deleted man.vaz'}
       messages.prepend {para 'Complete. Disconnecting.'}
       @mission = {"mission" => 1}
       Lib.gsw.puts YAML.dump(@mission)
       require_relative '../mails/one_complete.rb'
       close
      end
      timer 16 do
       messages.prepend {para 'deleted data.vaz'}
       messages.prepend {para 'deleting man.vaz'}
      end
      timer 10 do
       messages.prepend {para 'deleted memory.vaz'}
       messages.prepend {para 'deleting data.vaz'}
      end
      timer 6 do
       messages.prepend {para 'deleted functions.vaz'}
       messages.prepend {para 'deleting memory.vaz'}
      end
      timer 4 do
       messages.prepend {inscription}
       messages.prepend {para 'deleting functions.vaz'}
      end
      
      para 'Running MassDeletion5, getting file list.'
      timer 2 do
       messages.prepend do
        para '/home/dla/functions.vaz'
        para '/home/dla/memory.vaz'
        para '/home/dla/data.vaz'
        para '/home/dla/man.vaz'
       end
      timer 1 do
       messages.prepend {para "Found 4 '.vaz' files:"}
      end
      end
      else
       para "Command '#{$cmd.text}' not found.\n Type 'help' for a list of commands", stroke: red
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
