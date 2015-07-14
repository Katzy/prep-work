def stock_picker(array)
  best_combo = []
  current_max = 0
  temp_max = array[0]
  temp_min = array[0]
  temp_max_index = 0
  temp_min_index = 0
  k = 1

  if array.length <= 1
    best_combo
  else
    until k == array.length
      if array[k] > array[k-1]
        temp_max = array[k]
        temp_max_index = k
        if temp_max_index > temp_min_index && temp_max - temp_min > current_max
          current_max = temp_max - temp_min
        end
      elsif array[k] <= array[k-1]
        if temp_max - temp_min > current_max
          temp_max = array[k]
          temp_max_index = k
        end
        if array[k] <= temp_min
          temp_min = array[k]
          temp_min_index = k

          if temp_max_index > temp_min_index && temp_max - temp_min > current_max
            current_max = temp_max - temp_min
          end
        end
      end
      if temp_min_index > temp_max_index
        best_combo = []
      else
        best_combo = [temp_min_index, temp_max_index]
      end
      k += 1
    end
  end

  best_combo
end

if __FILE__ == $0

p stock_picker([]) == []                               #  no prices
p stock_picker([1]) == []                              #  one price, no pair
p stock_picker([20, 10, 3, 18, 16, 30, 11]) == [2, 5]  #  several peaks & valleys, ends down
p stock_picker([20, 10, 5, 8, 4, 10]) == [4, 5]        #  ends higher
p stock_picker([10, 20, 30, 25, 80, 1, 81]) == [5, 6]
p stock_picker([3, 10, 3, 18, 16, 30, 11]) == [2, 5]   #  two min prices, uses most recent
p stock_picker([8000, 10, 100000000]) == [1, 2]
p stock_picker([8000, 10, 0, 8001, -1, 10001]) == [4, 5] #  works with negative #'s
p stock_picker([0, 1, 2, 3, 1]) == [0, 3]
p stock_picker([1, 1, 1, 5, 1, 1, 1, 1, 10]) == [7, 8]


end

