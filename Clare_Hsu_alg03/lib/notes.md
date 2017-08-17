Heap: binary tree, has to be complete (no gaps)
- left to right
- O(log(n)) 

Extract: extract the root - heapify_down
- swap with last element
- class methods
- child indices: 
``` ruby 
2 * parent_index + 1,  2 * parent_index + 2
```
- parent_indices:
``` ruby
(parent_idx - 1)/2
```