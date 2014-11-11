require_relative "../../lib/data_structures/weighted_graph"
require "minitest/autorun"

class WeightedGraphTest < Minitest::Test

  def test_minimum_spanning_tree
    wg = DataStructures::WeightedGraph.new
    wg.add_vertex("A")
    wg.add_vertex("B")
    wg.add_vertex("C")
    wg.add_vertex("D")
    wg.add_vertex("E")
    wg.add_vertex("F")

    wg.add_edge(0, 1, 6) #AB 6
    wg.add_edge(0, 3, 4) #AD 4
    wg.add_edge(1, 2, 10) #BC 10
    wg.add_edge(1, 3, 7) #BD 7
    wg.add_edge(1, 4, 7) #BE 7
    wg.add_edge(2, 3, 8) #CD 8
    wg.add_edge(2, 4, 5) #CE 5
    wg.add_edge(2, 5, 6) #CF 6
    wg.add_edge(3, 4, 12) #DE 12
    wg.add_edge(4, 5, 7) #EF 7

    result = wg.minimum_spanning_tree
    assert_equal(["AD", "AB", "BE", "EC", "CF"], result)
  end
end
