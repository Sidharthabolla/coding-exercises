class MagicSquare
  # Implement a method that takes a 2D array,
  # checks if it's a magic square and returns either true or false depending on the result.
  # sequence (https://en.wikipedia.org/wiki/Magic_square)

  def self.validate(square)

  # return false if the array is empty or smaller than 3x3 (by definition)
    return false if square.size < 3

  # return false if the array is not square
    rows = square.size-1
    columns = square[rows].size-1
    return false if rows != columns

  # return false if diagonals dont sum up
    sum = 0
    counter = 0
    cols = columns

    (0..rows).each do |r|
      sum += square[r][r]
    end

    (0..rows).each do |r|
      counter += square[r][cols]
      cols = cols-1
    end

    return false if counter != sum

  # checking columns
    square.each do |r|
      counter = 0
      r.each do |c|
        counter += c
      end
      return false if counter != sum
    end

  # checking rows
    (0..columns).each do |c|
      counter = 0
      (0..rows).each do |r|
        counter += square[r][c]
      end
      return false if counter != sum
    end

  # return true if none of the above checks fail
    return true
  end
end
