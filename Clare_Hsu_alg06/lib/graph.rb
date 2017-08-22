class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    @to_vertex.in_edges << self
    @to_vertex.out_edges << self
    @from_vertex.in_edges << self
    @from_vertex.out_edges << self

  end

  def destroy!
    @to_vertex.in_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex.out_edges.delete(self)
    @from_vertex.in_edges.delete(self)
    @to_vertex = nil
    @from_vertex = nil


  end
end
