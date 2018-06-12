expression = gets.chomp.strip.scan(/\S/)
expression1 = []
loop do
s = 0
e = 0
i = 0

e = expression.index(")")
s = e
loop do
  break if expression[s] == "("
  s-=1
end

expression.delete_at(e)
expression.delete_at(s)

i = s
for s in s..e-2
  expression1 << expression.delete_at(i)
end

break if expression.index("(") == nil
end
puts expression1.join(" ")



