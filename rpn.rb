output=[]
output1=[]
output2=[]
operands=[]
operand=0
expression1 = []
i = 0
expression = gets.chomp.strip.scan(/\S/)

loop do

  expression.each do |the_element_of_expression|
    if the_element_of_expression == "("
      i+=1
      output << "$"
    end
    if i != 0
      expression1 << the_element_of_expression
    else
      if the_element_of_expression == "^" || the_element_of_expression == "*" || the_element_of_expression == "+" || the_element_of_expression == "/" || the_element_of_expression == "-"
        operand = the_element_of_expression
      else
        output << the_element_of_expression
      end
    end
    if the_element_of_expression == ")"
      i-=1
    end

    if operand != 0
      if operand == "+" || operand == "-"
        loop do
          if operands.index("^") != nil
            output<<operands.delete_at(operands.index("^"))
          elsif operands.index("*") != nil
            output<<operands.delete_at(operands.index("*"))
          elsif operands.index("/") != nil
            output<<operands.delete_at(operands.index("/"))
          end
          break if operands.index("^") == nil and operands.index("*") == nil and operands.index("/") == nil
        end
        if operands.index("+")!= nil
          output<<operands.delete_at(operands.index("+"))
        elsif operands.index("-")!= nil
          output<<operands.delete_at(operands.index("-"))
        end
        operands<<operand
        operand = 0

      elsif operand == "*" || operand == "/"
        loop do
          break if operands.index("^") == nil
          output<<operands.delete_at(operands.index("^"))
        end
        if operands.index("*")!= nil
          output<<operands.delete_at(operands.index("*"))
        elsif operands.index("/")!= nil
          output<<operands.delete_at(operands.index("/"))
        end
        operands<<operand
        operand = 0

      else operand == "^"
      operands<<operand
      operand = 0
      end
    end
  end


  loop do
    break if operands == []
    output << operands.pop
  end

  expression1.delete("(")
  expression1.delete(")")

  expression = expression1
  expression1 = []


  if output1 == []
    output1 = output
  else
  output1[output1.index("$")] = output

  end
  output = []



  break if expression == []
end
puts output1.join("")