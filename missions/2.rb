require 'green_shoes'
require 'etc'
require_relative '../lib.rb'

Shoes.app do
 para "Mission Two"
 para 'No Mission Available Yet.'
 button 'Close' do
  Lib.main
  close
 end
end

#@mission = {"mission" => 2}
#Lib.gsw.puts YAML.dump(@mission)
