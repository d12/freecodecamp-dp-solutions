
# Naive solution, no DP
# Time complexity:
# target.length = t
# word_bank.length = b
# Worst case, every word in word bank is 1 char long, so we need to iterate t times
# For each iteration, we need to check each word in word_bank
# O(t^2 * b) time, O(t) space

# Also, this doesn't work.
# It's too greedy and misses some options
# puts can_construct("eef", ["ee", "eef"]) == false, but it should be true
def can_construct(target, word_bank)
  target_index = 0

  while target_index < target.length
    made_progress_last_iteration = false

    word_bank.each do |word|
      # require "byebug"; byebug
      if target[target_index..(target_index + word.length - 1)] == word && word.length == target[target_index..(target_index + word.length - 1)].length
        target_index += word.length
        made_progress_last_iteration = true
      end
    end

    break unless made_progress_last_iteration
  end

  target_index == target.length
end

# DP solution:
# target.length = t
# word_bank.length = b
# worst case t deep
# O(t*b*t) time = O(t^2 * b)
# O(t^2) space
def can_construct(target, word_bank, memo = {})
  return true if target == ""
  return memo[target] if memo.key?(target)

  word_bank.each do |word|
    if target.start_with?(word) && can_construct(target[word.length..-1], word_bank, memo)
      return true
    end
  end

  memo[target] = false
end

puts can_construct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "ee", "eee", "eeee", "eeeee", "eeeeee", "eeeeeeee", "eeeeeeeee"])
puts can_construct("eef", ["ee", "eef"])