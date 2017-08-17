require_relative 'heap'

def k_largest_elements(array, k)
    store = BinaryMinHeap.new()
    array[0..k-1].each do |el|
        store.push(el)
    end
    array[k...array.length].each do |el|
        if el > array[0]
            original = array[0]
            array[0] = el
            el = original
        end
    end
    array
end
