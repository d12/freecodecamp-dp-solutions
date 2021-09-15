def can_sum(target, nums, memo = {})
  return memo[target] if memo.key?(target)

  return true if target == 0
  return false if target < 0

  nums.each do |i|
    return true if can_sum(target - i, nums, memo)
  end

  memo[target] = false
  return false
end

puts can_sum(2009, [10, 4, 2])