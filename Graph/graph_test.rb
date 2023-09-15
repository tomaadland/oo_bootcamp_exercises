
require 'minitest/autorun'
require_relative 'node'

class GraphTest < Minitest::Test

  def setup
    @a = Node.new
    @b = Node.new
    @c = Node.new
    @d = Node.new
    @e = Node.new
    @f = Node.new
    @g = Node.new
    build_graph
  end
  
  def test_can_reach
    assert @a.can_reach?(@a)
    assert @b.can_reach?(@a)
    assert @b.can_reach?(@f)
    assert @b.can_reach?(@d)
    assert @d.can_reach?(@b)
    refute @a.can_reach?(@b)
  end

  def test_hop_count
    assert_equal 0, @a.hop_count(@a)
    assert_equal 1, @b.hop_count(@a)
    assert_equal 1, @b.hop_count(@f)
    assert_equal 2, @b.hop_count(@d)
    assert_equal 4, @c.hop_count(@f)
  end
  
  private 
  def build_graph
    @b.to(@a)
    @b.to(@c).to(@d).to(@e).to(@b).to(@f)
    @c.to(@d)
    @c.to(@e)
  end
end


