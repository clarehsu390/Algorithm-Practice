# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'
def install_order(arr)
    ids = []
    sorted = []
    max = 0
    arr.each do |el|
        max = el[0] if max < el[0]
    end
    vertices = []
    (1..max).to_a.each do |value|
        vertices << Vertex.new(value)
    end

    arr.each do |package|
        Edge.new(vertices[package[1] - 1], vertices[package[0] - 1])
    end

    topological_sort(vertices).each {|el| sorted << el.value}
    sorted
    
end

