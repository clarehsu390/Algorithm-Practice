require_relative 'heap'

def k_largest_elements(array, k)
    store = BinaryMinHeap.new()
    k.times do
        store << array.pop
    end
    until array.empty?
        store << array.pop
        store.extract
    end
    store.store
end
