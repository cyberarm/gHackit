require 'green_shoes'
require 'etc'

Shoes.app title: 'gHackit - Game Complete' do
 background '#999'
 stack do
  background '#222'
  caption 'gHackit', stroke: '#999'
 end
 caption "You completed the game!"
 para "Congratz, #{Etc.getlogin}."
 para "-------------------------------------"
 para 'Game created by:'
 para link('cyberarm', click: 'https://github.com/cyberarm')
 para 'Game source-code:'
 para link('https://github.com/cyberarm/gHackit', click: 'https://github.com/cyberarm/gHackit')
end
