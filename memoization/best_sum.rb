def best_sum(target, nums, memo = {})
  return memo[target] if memo.key?(target)
  return if target < 0

  return [] if target == 0

  results = nums.map do |i|
    res = best_sum(target - i, nums, memo)
    res.is_a?(Array) ? [i] + res : nil
  end

  results.compact!
  if results.empty?
    memo[target] = nil
  else
    memo[target] = results.min_by {|a| a.length}
  end
end

puts best_sum(14, [1, 2, 5, 7, 15])