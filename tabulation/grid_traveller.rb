# Time complexity: O(x * y)
# Space complexity: O(x * y)

def grid_traveller(x, y)
  table = Array.new(x) { Array.new(y) { 0 } }
  table[0][0] = 1

  table.each_with_index do |row, i|
    row.each_with_index do |val, j|
      table[i][j] += table[i-1][j] if i > 0
      table[i][j] += table[i][j-1] if j > 0
    end
  end

  table[x - 1][y - 1]
end

puts grid_traveller(3, 3)