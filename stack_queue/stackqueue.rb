require_relative 'stack.rb'

class StackQueue
    def initialize
        @in_stack = Stack.new
        @out_stack = Stack.new
    end

    def enqueue(el)
        @in_stack.push(el)
    end

    def dequeue
        #O(n), complete this once for every n dequeue --> ammortized to O(1)
        until empty?
            @out_stack << @in_stack.pop
        end
        @out_stack.pop
    end

    def empty?
        @in_stack.length == 0
    end

    def size
        @in_stack.length + @out_stack.length
    end
end