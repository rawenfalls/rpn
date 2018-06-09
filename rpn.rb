output=[]
operands=[]

expression = gets.chomp.strip.scan(/\S/)
expression.each do |the_element_of_expression|
  case the_element_of_expression
    when  "+"
      if operands.index("-") != nil or operands.index("+") != nil
        output << operands.delete("/")
        output << operands.delete("*")
        output << operands.delete("+")
        output << operands.delete("-")
      end
      operands << the_element_of_expression
    when "-"
      if operands.index("+") != nil or operands.index("-") != nil
        output << operands.delete("/")
        output << operands.delete("*")
        output << operands.delete("+")
        output << operands.delete("-")
      end
      operands << the_element_of_expression

    when  "*"
      if operands.index("/") != nil or operands.index("*") != nil
        output << operands.delete("/")
        output << operands.delete("*")
      end
      operands << the_element_of_expression
    when "/"
      if operands.index("*") != nil or operands.index("/") != nil
        output << operands.delete("/")
        output << operands.delete("*")
      end

      operands << the_element_of_expression

    when "^"

      operands << the_element_of_expression

    else
      output << the_element_of_expression
      if operands.index("^") != nil
        output << operands.delete("^")
      end
  end

end
loop do
  break if operands == []
  output << operands.pop
end
output << operands
puts output.join("")

