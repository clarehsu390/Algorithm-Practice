class DynamicProgramming

  def initialize
    @blair_cache = {1 => 1, 2 => 2}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    number = blair_nums(n-1) + blair_nums(n-2) + (2 * n - 3)
    @blair_cache[n] = number
    number
  end

  def frog_hops_bottom_up(n)
   frog_cache_builder(n)[n]

  end

  def frog_cache_builder(n)
    #[[1,1,1], [1,2], [2,1], [3]]
    cache = {1 => [[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]]}
    return cache if n <= 3
    (4..n).each do |i|
      arr = []
      (1..3).each do |num|
        cache[i - num].each do |el|
          
          arr << el + [num]
        end
      end
        cache[i] = arr
    end

    cache

  end

  def frog_hops_top_down(n)
    return [[1]] if n == 1
    return [[1,1], [2]] if n == 2
    frog_hops_top_down_helper(n)
    

  end

  def frog_hops_top_down_helper(n)
    @cache = {1 => [[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]]}
    return @cache[n] if @cache[n]
    (4..n).each do |i|
      arr = []
      (1..3).each do |num|
        @cache[i - num].each do |el|
          
          arr << el + [num]
        end
      end
        @cache[i] = arr
    end

    @cache[n]

  end

  def super_frog_hops(n, k)
    
   cache = {1 => [[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]]}
    return cache[n].select {|el| el[0] <= k} if n > k && cache[n]
    return cache[n] if cache[n]
    



  end

  def knapsack(weights, values, capacity)
    return 0 if weights.empty? || values.empty? || capacity == 0
    if values.max > capacity
      return values.max
    end


  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
