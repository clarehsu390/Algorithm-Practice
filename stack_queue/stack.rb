class MyStack
    def initialize
        @store = []
    end

    def pop
        @store.pop
    end

    def push(el)
        @store << el
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.length == 0
        #@store.empty?
    end
end