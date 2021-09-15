# Complexity:
# t = target length
# b = bank size
# We will go t levels deep max
# for each level, we iterate over word bank and iterate over target
# so, O(t * b * t) == O(t^2 * b) time
#
# For space, the memo stores t values of constant size
# Also for each layer (t), we store a substring of t on the stack.
# So, O(t^2) space complexity.
def count_construct(target, word_bank, memo = {})
  return 1 if target == ""
  return memo[target] if memo.key?(target)

  count = word_bank.sum do |word|
    if target.start_with?(word)
      count_construct(target[word.length..-1], word_bank, memo)
    else
      0
    end
  end

  memo[target] = count
end

puts count_construct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "ee", "eee", "eeee", "eeeee", "eeeeee", "eeeeeeee", "eeeeeeeee"])
puts count_construct("eef", ["ee", "eef"])
puts count_construct("aaaaaaaa", ["a", "aa", "aaa", "aaaa"])
puts count_construct("abcdef", ["ab", "abc", "cd", "def", "abcd"])
puts count_construct("purple", ["purp", "p", "ur", "le", "e"])