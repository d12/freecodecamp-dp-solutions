def how_sum(target, nums, memo = {})
  return memo[target] if memo.key?(target)
  return if target < 0

  return [] if target == 0

  nums.each do |i|
    res = how_sum(target - i, nums, memo)
    if res.is_a? Array
      return [i] + res
    end
  end

  memo[target] = nil
end

puts how_sum(2001, [4, 2])