require_relative 'stack.rb'

class MinMaxStack
    def initialize
        @store = Stack.new
    end

    def empty?
        @store.empty?
        #@store.length == 0
    end

    def min
        @store.peek[:min] unless empty?
    end

    def max
        @store.peek[:max] unless empty?
    end

    def peek
        @store.peek[:value] unless empty?
    end

    def pop
        @store.pop[:value] unless empty?
    end

    def size
        @store.size
    end

    def push(val)
        @store.push({
            min: new_min(val),
            max: new_max(val),
            value: val
        })
        
    end

    private

    def new_max(val)
        empty? ? val : [val, max].max
    end
    
    def new_min(val)
        empty? ? val : [val, min].min
    end
end
