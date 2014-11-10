require_relative "../../lib/data_structures/graph"
require "minitest/autorun"

class GraphTest < Minitest::Test

  def setup
    @g = DataStructures::Graph.new
    @g.add_vertex("A")
    @g.add_vertex("B")
    @g.add_vertex("C")
    @g.add_vertex("D")
    @g.add_vertex("E")
    
    @g.add_edge(0,1)
    @g.add_edge(1,2)
    @g.add_edge(0,3)
    @g.add_edge(3,4)
  end
  
  def test_graph_depth_first_search
    dfs = @g.depth_first_search
    assert_equal("ABCDE", dfs)
  end

  def test_breadth_first_search
    bfs = @g.breadth_first_search
    assert_equal("ABDCE", bfs)
  end
end
