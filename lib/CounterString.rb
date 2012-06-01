class CounterString
  def initialize()
    @position_marker_character = "*"
  end

  def generate(length=0)
    output = ''
    length = length.to_i
    while output.length < length
      diff = length - output.length
      output = "*" + output
      output = ((diff > 1) ? diff.to_s : "") + output
    end
    output
  end

end
