class Graph
  def initialize
    @nodes = []
  end

  def add_node(node)
    @nodes << node
  end
end


class GraphNode
  
  def initialize(val)
    @val = val
    @neighbors = []
  end
end
