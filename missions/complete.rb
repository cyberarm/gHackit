require 'green_shoes'
require 'etc'

Shoes.app do
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
end
