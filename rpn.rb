loop do
  output=[]
  operands=[]
  operand=0


  expression = gets.chomp.strip.scan(/\S/)
  expression.each do |the_element_of_expression|
    if the_element_of_expression == "^" || the_element_of_expression == "*" || the_element_of_expression == "+"
      operand = the_element_of_expression
    else
      output << the_element_of_expression
    end

    if operand != 0
      case operand
        when "+"
          loop do
            loop do
              break if operands.index("^") == nil
              output<<operands.delete_at(operands.index("^"))
            end
            break if operands.index("*") == nil
            output<<operands.delete_at(operands.index("*"))
          end
          if operands.index("+")!= nil
            output<<operands.delete_at(operands.index("+"))
          end

          operands<<operand
          operand = 0
        when "*"
          loop do
            break if operands.index("^") == nil
            output<<operands.delete_at(operands.index("^"))
          end
          operands<<operand
          operand = 0
        when "^"
          operands<<operand
          operand = 0
      end

    end
  end
  loop do
    break if operands == []
    output << operands.pop
  end
  puts output.join("")
end