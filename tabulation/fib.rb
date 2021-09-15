def fib(n)
  table = Array.new(n + 1) { 0 }
  table[1] = 1

  table.each_with_index do |num, index|
    table[index + 1] += num if table[index + 1]
    table[index + 2] += num if table[index + 2]
  end

  table[n]
end

puts fib(50)