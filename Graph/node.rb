
class Node

  private
  attr_reader :neighbors
  UNREACHABLE = -1

  public 

  def initialize
    @neighbors = []
  end

  def to(neighbor_node)
    self.neighbors << neighbor_node

    return neighbor_node
  end

  def can_reach?(destination, visited_nodes=[])
    return true if self == destination
    return false if visited_nodes.include?(self)

    visited_nodes << self
    
    self.neighbors.each do |neighbor|
      return true if neighbor.can_reach?(destination, visited_nodes)
    end

    return false
  end
  
  def hop_count(destination)
    hops = self._hop_count(destination)
    raise ArgumentError, "Destination is unreachable" if hops == UNREACHABLE
    return hops
  end

  private

  def _hop_count(destination, visited_nodes = [])
    return 0 if self == destination
    return UNREACHABLE if visited_nodes.include?(self)

    visited_nodes << self
    
    @neighbors.each do |neighbor|
      neighbor_hop_count = neighbor.send(:_hop_count,destination, visited_nodes)
      return neighbor_hop_count + 1 if neighbor_hop_count != UNREACHABLE
    end

    return UNREACHABLE
  end

end

