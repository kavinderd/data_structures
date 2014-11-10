require_relative "../../lib/data_structures/graph"
require "minitest/autorun"

class GraphTest < Minitest::Test
  
  def test_graph_depth_first_search
    g = DataStructures::Graph.new
    g.add_vertex("A")
    g.add_vertex("B")
    g.add_vertex("C")
    g.add_vertex("D")
    g.add_vertex("E")
    
    g.add_edge(0,1)
    g.add_edge(1,2)
    g.add_edge(0,3)
    g.add_edge(3,4)

    dfs = g.depth_first_search
    assert_equal("ABCDE", dfs)
  end
end
