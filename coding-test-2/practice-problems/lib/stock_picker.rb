
def stock_picker(array)
  best_combo = []
  current_max = 0
  temp_price = array[0]
  temp_price2 = 0
  temp_buy_index = 0
  temp_sell_index = 1
  k = 0

  until k == array.length - 1
    if array[k+1] > array[k]
      until k == array.length - 1 || array[k+1] < array[k]
        k += 1
        temp_price2 = array[k]
        temp_sell_index = k
      end
      current_max = temp_price2 - temp_price
    elsif array[k+1] < array[k]
      until k == array.length - 1 || array[k+1] > array[k]
        k += 1
        if array[k+1] > array[k]
          if array[k] > temp_price
            until k == array.length - 1 || array[k+1] < array[k]
              k += 1
              current_max = array[k] - temp_price
              if array[-1] - temp_price > current_max
                temp_price2 = array[-1]
                temp_sell_index = array.length - 1
              else
                temp_price2 = array[k]
                temp_sell_index = k
              end
            end
          else
            temp_price = array[k]
            temp_buy_index = k
            until k == array.length - 1 || array[k+1] < array[k]
              k += 1
              temp_price2 = array[k]
              temp_sell_index = k
            end
          end
        end
        current_max = temp_price2 - temp_price
        best_combo = temp_buy_index, temp_sell_index
      end
    end
  end
 p  current_max
 p best_combo
end
