class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    pivot = array.pop
    right = []
    left = []
    array.each do |el|
      if el >= pivot
        right << pivot
      else
        left << pivot
      end
    end
    sort1(left) + [pivot] + sort1(right)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new {|x,y| x <=> y}

    return array if length < 2
    pivot = partition(array, start, length, &prc)
    left_length = pivot - start
    right_length = length - pivot - 1
    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot + 1, right_length, &prc)

    array

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|x,y| x <=> y}
    pivot_idx = start #pointer to pivot
    pivot = array[start]
    ((start+1)...(start+length)).each do |idx|
      if prc.call(pivot, array[idx]) == 1
        array[start + 1], array[idx] = array[idx], array[start + 1]
        start += 1
      end
    end
      array[pivot_idx], array[start] = array[start], array[pivot_idx]
      start

  end
end
