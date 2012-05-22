require 'green_shoes'
require 'yaml'
require 'fileutils'
require './lib'

save = YAML.load(Lib.gsr.read)

begin
if save['mission'] == 1
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

rescue NoMethodError
 puts "loading MissionOne"
 require './missions/1.rb'
end
