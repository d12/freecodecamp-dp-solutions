# Also solves best_sum by not replacing a table val if it already exists
# Time: O(n^2 * m)
# space: O(n^2)

def how_sum(target, nums)
  # table maps from target to paths
  table = Array.new(target + 1) { nil }
  table[0] = []

  table.each_with_index do |path, i|
    next unless path

    nums.each do |num|
      table[i + num] = path + [num] unless table[i + num] || (i + num) > target
    end
  end

  table[target]
end

puts how_sum(10, [10, 1, 2, 3, 4])