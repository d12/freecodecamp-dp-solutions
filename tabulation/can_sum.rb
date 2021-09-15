# Look backwards, not super optimal
def can_sum(target, nums)
  table = Array.new(target + 1) { false }

  table[0] = true

  table.each_with_index do |can_sum, i|
    next if can_sum
    nums.each do |num|
      if table[i - num]
        table[i] = true
        break
      end
    end
  end

  puts table.inspect

  table[target]
end

# Look forwards, better
def can_sum(target, nums)
  table = Array.new(target + 1) { false }

  table[0] = true
  table.each_with_index do |can_sum, i|
    next unless can_sum
    nums.each do |num|
      table[i + num] = true if (i + num) <= target
    end
  end

  puts table.inspect

  table[target]
end

puts can_sum(100, [6, 7])