$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'CounterString'

describe CounterString do
  before(:each) do
    @cs = CounterString.new
  end

  it "returns blank for no arguments" do
    @cs.generate.should == ""
  end

  it "returns blank for negative numbers" do
    @cs.generate(-1).should == ""
  end

  it "returns 1 for length 1" do
    @cs.generate(1).should == "*"
  end

  it "returns 2* for length 2" do
    @cs.generate(2).should == "2*"
  end

  it "returns *3* for length 3" do
    @cs.generate(3).should == "*3*"
  end

  it "returns *3*5*7*9* for length 9" do
    @cs.generate(9).should == "*3*5*7*9*"
  end

  it "returns *3*5*7*10* for length 10" do
    @cs.generate(10).should == "*3*5*7*10*"
  end

  it "returns 2*4*6*8*11* for length 11" do
    @cs.generate(11).should == "2*4*6*8*11*"
  end

  it "returns ...100* for length 100" do
    string = @cs.generate(100)
    string.size.should == 100
    string[-4..-1].should == "100*"
  end

  it "returns ...2047* for length 2047" do
    string = @cs.generate(2047)
    puts string
    string.size.should == 2047
    string[-5..-1].should == "2047*"
  end

  it "allows reasonable numeric-looking strings as arguments" do
    @cs.generate("3").should == "*3*"
  end

  it "should reset output on subsequent calls" do
    @cs.generate(3).should == "*3*"
    @cs.generate(5).should == "*3*5*"
  end
end
