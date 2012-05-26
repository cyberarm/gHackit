require 'green_shoes'
require 'etc'
require_relative '../lib.rb'

puts 'loading MissionTwo'

$lo = false 
$tools = false
$pc2 = false

Shoes.app title: 'gHackit - Mission Two: Destroy the competition'  do
puts 'loaded MissionTwo'
 background '#999'
 flow do
  background "#222"
  caption 'gHackit - 1.421.231.132', stroke: '#999'
 end
 flow do
  background 'green'
  para "Mission Two: Destroy the competition."
  button 'Message' do
   window do
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
  para 'We will need some tools, FanStopper7 and LockOut0.1'
  para 'fetch them with: retrieve_tools'
 end
 
  keypress do |k|
  if k == "\n"
   messages.prepend do
    if $cmd.text == ""
    else
     if $cmd.text == "exit"
      para 'Exiting...', stroke: darkred
      inscription
      timer 1.3 do
       exit
      end
      
     elsif $cmd.text == 'retrieve_tools'
      para 'downloading LockOut0.9... please wait'
      para 'retrieving tools: LockOut0.9 and FanStopper7'
      timer 10 do
       messages.prepend {para 'downloaded LockOut0.9'}
       messages.prepend {para 'downloading FanStopper7... please wait'}
      end
      timer 20 do
       messages.prepend {para 'downloaded FanStopper7'}
       messages.prepend {para 'installing LockOut0.9'}
       messages.prepend {para 'installing FanStopper7'}
       messages.prepend {para "run: 'portcrack' to start attack.", stroke: lime}
       $tools = true
      end
      inscription
      
     elsif $cmd.text == 'help'
      para 'retrieve_tools - retrieve tools required for mission.'
      para 'exit - close gHackit.'
      para 'fanstop - stops target computers fans, which cause them to overheat and meltdown.'
      para "portcrack - hack into the computer system."
      para "lockout - hack into the computer system and lock them out, making yourself the systems administrator."
      inscription
      
     elsif $cmd.text == 'portcrack'
      if $tools == true
       para 'starting attack against: IP: 1.513.384.109 on Port: 21.'
       pro = para 'progress: 0%'
       timer 3 do
        pro.text = 'progress: 25%'
       end
       timer 7 do
        pro.text = 'progress: 50%'
       end
       timer 10 do
        pro.text = 'progress: 75%'
       end
       timer 14 do
        pro.text = 'progress: 100%'
        messages.prepend {para "run: 'lockout' to prevent Micro Computing Inc. from being able to start the fans.", stroke: lime}
        $pc2 = true
       end
      else
       para "Command '#{$cmd.text}' not found.\n Is it installed?", stroke: darkred
      end
      inscription
      
     elsif $cmd.text == 'lockout'
      if $pc2 == true
      para 'Running LockOut0.9'
       prog = para 'progress: 0%'
       status = para 'Patching Operating System...' 
       timer 7 do
        prog.text = 'progress: 28%'
        status.text = 'Patched system.'
       end
        timer 8.5 do
         status.text = 'Rooting system...Keyboard'
        end
        timer 10.5 do
         status.text = 'Rooting system...Mouse'
        end
        timer 12.5 do
         status.text = 'Rooting system...WI-FI'
        end
       timer 15 do
        prog.text = 'progress: 50%'
        status.text = 'Rooted system.'
       end
        timer 17 do
         status.text = 'Turning off screens...'
       end
       timer 20 do
        prog.text = 'progress: 83%'
        status.text = 'Screens off.'
       end
       timer 26 do
        prog.text = 'progress: 100%'
        status.text = 'You are now admin.'
        messages.prepend {para "run 'fanstop' to stop fans and melt their computers.", stroke:lime}
        $lo = true
       end
      else
       para "Command '#{$cmd.text}' not found.\n Is it installed or 'portcrack' ran?", stroke: darkred
      end
      inscription
      
     elsif $cmd.text == 'fanstop'
      if $lo == true
      para 'Running FanStopper7'
       prog = para 'progress: 0%'
       status = para 'flashing BIOS with FanGoner9 patch...' 
       timer 7 do
        prog.text = 'progress: 28%'
        status.text = 'Patched BIOS.'
       end
        timer 8.5 do
         status.text = 'Setting Fan speed to 0.0...'
        end
        timer 10.5 do
         status.text = 'Fans are slowing down...'
        end
        timer 12.5 do
         status.text = 'slowing...'
        end
       timer 15 do
        prog.text = 'progress: 50%'
        status.text = 'fans stopped...'
       end
        timer 22 do
         status.text = 'motherboard failing...'
       end
       timer 30 do
        prog.text = 'progress: 83%'
        status.text = 'harddrive failing...'
       end
       timer 40 do
        prog.text = 'progress: 100%'
        status.text = 'Error: lost  connection.'
        messages.prepend {para "Mission complete, computers melted.", stroke:lime}
        $lo = true
       end
       timer 46 do
        @mission = {"mission" => 2}
        Lib.gsw.puts YAML.dump(@mission)
        require_relative '../mails/two_complete.rb'
        close
       end
      else
       para "Command '#{$cmd.text}' not found.\n Is it installed or 'lockout' ran?", stroke: darkred
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
