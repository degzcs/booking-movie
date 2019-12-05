require './config/environment.rb'
begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "Pry not found, using 'irb' instead. Try\n  gem install pry"
end

