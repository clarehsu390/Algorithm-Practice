## Quick Sort 
- optimizing for space complexity (switch in place); using same original array
- base case: return original array if length <= 1
- pivot: first element(array[0])
- left & right array: call sort on each of those arrays => left + [pivot] + right
- worst case: n ** 2
- space complexity: O(1) - don't include inputs

#### In-place version
- rely on partition method that is passed the whole array
- rearranges a subset of elements around a pivot_el
- force different element as the first element

Helper method: #partition
- returns index at which the pivot element ended up, to update bounds!
- pivot --> shift index over one
- still comparing to original pivot
- start from the leftmost element and keep track of the index of smaller elements to i; if we find a smaller element, we swap current element with arr[i]

