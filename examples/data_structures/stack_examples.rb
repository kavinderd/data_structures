require_relative '../../lib/data_structures/stack'

class BracketChecker
  Pairs = { "{" => "}", "[" => "]", "(" => ")" }

  def initialize(input)
    @input = input
    @stack = DataStructures::Stack.new(@input.size)
  end

  def check
    @input.chars.each do |char|
      if opener?(char)
        @stack.push(char)
      elsif closer?(char)
        popped = @stack.pop
        if popped
          if matching?(popped, char)
          else
            raise "Error at #{char}"
          end
        else
          raise "Error at #{char}"
        end
      end
    end
    raise "Error: missing right delimiter" unless @stack.empty?
    "It Passes"
  end

  private

  def opener?(char)
    ['{', '[', '('].one? { |e| e == char }
  end

  def closer?(char)
    ['}', ']', ')'].one? { |e| e == char }
  end

  def matching?(opener, closer)
    Pairs[opener] == closer
  end

end

input = "a{b(c)d}e"
bc = BracketChecker.new(input)
puts bc.check

input = "a{b[c}"
begin
  BracketChecker.new(input).check
rescue Exception => e
  puts e
end
