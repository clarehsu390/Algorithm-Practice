## Quick Sort 
- optimizing for space complexity (switch in place); using same original array
- base case: return original array if length <= 1
- pivot: first element(array[0])
- left & right array: call sort on each of those arrays => left + [pivot] + right
- worst case: n ** 2

#### In-place version
- rely on partition method that is passed the whole array
- rearranges a subset of elements around a pivot_el
- force different element as the first element