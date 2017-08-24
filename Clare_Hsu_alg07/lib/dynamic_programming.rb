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
    # (1..k).each do |num|
    #   arr = []
    #   cache[n - 1].each do |el|
    #     arr << el + [num]
    #   end
    #   cache[num] = arr
    # end
    # cache[n]


  end

  def knapsack(weights, values, capacity)
    return 0 if weights.empty? || values.empty? || capacity == 0
    return values.max if weights.any? {|el| el == capacity}
    solution_table = knapsack_table(weights, values, capacity)
    solution_table[capacity][-1]

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solution_table = []
    (0..capacity).each do |i|
      solution_table[i] = []
      (0..weights.length - 1).each do |j|
        if i == 0
          solution_table[i][j] = 0
        elsif j == 0
          solution_table[i][j] = weights[0] > i ? 0 : values[0]
        else

          option1 = solution_table[i][j-1]
          option2 = i < weights[j] ? 0 : solution_table[i-weights[j]][j-1]
          optimum = [option1, option2].max
          solution_table[i][j] = optimum
          end
      end
    end

      solution_table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
