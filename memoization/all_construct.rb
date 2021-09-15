def all_construct(target, word_bank, memo = {})
  return [[]] if target == ""
  return memo[target] if memo.key?(target)

  found_paths = []
  word_bank.each do |word|
    next unless target.start_with?(word)

    paths_for_word = all_construct(target[word.length..-1], word_bank, memo)
    found_paths += paths_for_word.map do |path|
      [word] + path
    end
  end

  memo[target] = found_paths
end

puts all_construct("purple", ["purp", "p", "ur", "le", "e"]).inspect
puts all_construct("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeez", ["e", "ee", "eee", "eeee", "eeeee", "eeeeee", "eeeeeeee", "eeeeeeeee"])