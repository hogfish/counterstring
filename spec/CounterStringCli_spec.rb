$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'stringio'

describe "CounterStringCli" do
  it "should copy the counterstring to clipboard" do
    system("ruby lib/CounterStringCli.rb 11")
    case RUBY_PLATFORM
      when /mswin/
        # windows has no paste command
      when /darwin/
        IO.popen('pbpaste', 'r+').read.should == "2*4*6*8*11*\n"
      else
        # no assertion
    end
  end

  it "should print the counterstring to the command line" do
    IO.popen("ruby lib/CounterStringCli.rb 14").read.should == "2*4*6*8*11*14*\n"
  end

  it "should print an error when there are no arguments" do
    IO.popen("ruby lib/CounterStringCli.rb").read.should == "Please specify the string length\n"
  end
end