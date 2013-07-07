class Calculator
  def initialize(num1, num2, operation)
    case operation
    when "+"
      @value = num1 + num2
    when "-"
      @value = num1 - num2
    when "*"
      @value = num1 * num2
    when "/"
      @value = num1 / num2
    else
      @value = "0"
    end
  end
  def readout
    @value
  end
end
