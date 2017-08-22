require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
    in_edge_count = {}
    queue = []
    visited = {}
    vertices.each do |vertex|
        in_edge_count[vertex] = vertex.in_edges.count
        queue << vertex if vertex.in_edges.empty?
    end
    sorted = []

    until queue.empty?
        vertex = queue.pop
        sorted << vertex

        vertex.out_edges.each do |edge|
            to_vertex = edge.to_vertex
            in_edge_count[to_vertex] -= 1
            queue << to_vertex if in_edge_count[to_vertex] == 0
        end
    end
    sorted.length == vertices.length ? sorted : []
end


