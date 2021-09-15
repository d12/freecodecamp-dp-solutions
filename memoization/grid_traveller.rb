def grid_traveller(x, y, memo = {})
  if x == 1 && y == 1
    return 1
  elsif x == 0 || y == 0
    return 0
  end

  cache_key = [x, y].sort
  return memo[cache_key] if memo[cache_key]

  memo[cache_key] = grid_traveller(x - 1, y, memo) + grid_traveller(x, y - 1, memo)
end