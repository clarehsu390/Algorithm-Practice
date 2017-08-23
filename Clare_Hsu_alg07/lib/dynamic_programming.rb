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
    #fibonnaci
    return [[1]] if n == 1
    return [[1,1], [2]] if n == 2
    sequence = [[1,1], [2]]

  end

  def frog_cache_builder(n)
    cache = {1 => frog_hops_bottom_up(1), 2 => frog_hops_bottom_up(2)}
    return cache[n]
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
