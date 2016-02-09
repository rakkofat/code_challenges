# You must buy before you can sell, you may not buy and sell in the same
# time step. Return the best profit you can make from 1 purchase and 1 sell
# of stock yesterday.

stock_prices_yesterday = [10, 7, 5, 3, 2, 1]

# My Solution

def get_max_profit(price_ary)
  current_max = nil
  price_ary.each_with_index do |buy_price, i|
    last = price_ary.length - 1
    unless i == last
      j = i + 1
      until j == last
        sell_price = price_ary[j]
        profit = sell_price - buy_price
        current_max = profit if current_max == nil || profit > current_max
        j += 1
      end
    end
  end
  return current_max
end

# Optimal Solution

def get_max_profit(stock_prices_yesterday)

    # make sure we have at least 2 prices
    if stock_prices_yesterday.length < 2
        raise IndexError, 'Getting a profit requires at least 2 prices'
    end

    # we'll greedily update min_price and max_profit, so we initialize
    # them to the first price and the first possible profit
    min_price = stock_prices_yesterday[0]
    max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

    stock_prices_yesterday.each_with_index do |current_price, index|

        # skip the first time, since we already used it
        # when we initialized min_price and max_profit
        if index == 0 then next end

        # see what our profit would be if we bought at the
        # min price and sold at the current price
        potential_profit = current_price - min_price

        # update max_profit if we can do better
        max_profit = [max_profit, potential_profit].max

        # update min_price so it's always
        # the lowest price we've seen so far
        min_price  = [min_price, current_price].min
    end

    return max_profit
end
