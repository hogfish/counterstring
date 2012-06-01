$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'CounterString'

cs = CounterString.new

def paste_command
  case RUBY_PLATFORM
    when /mswin/
      'clip'
    when /darwin/
      'pbcopy'
    else
      nil
  end
end

if ARGV[0] != nil
  output = cs.generate ARGV[0]
  `echo #{output} | #{paste_command}` if paste_command
  puts output
else
  puts "Please specify the string length"
end