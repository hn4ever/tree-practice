class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value = nil)
    @root = add_helper(@root, key, value)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def find(key)
    find_helper(@root,key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_helper(@root, [])
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    height_helper(@root)
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end

# Helper methods
def add_helper(current, key, value = nil)
  if current.nil?
    current = TreeNode.new(key, value)
  elsif key >= current.key
    current.right = add_helper(current.right, key, value)
  else
    current.left = add_helper(current.left, key, value)
  end
  
  return current

end

def find_helper(current, key)
  return nil if current.nil?

  if key == current.key
    return current.value
  elsif key > current.key
    return find_helper(current.right, key)
  elsif key < current.key
    return find_helper(current.left, key)
  end
end

def inorder_helper(node, array)
  # Left, Current, Right
  return array if node.nil?

  inorder_helper(node.left, array)
  array << {
    key: node.key,
    value: node.value
  }
  inorder_helper(node.right, array)
end

def preorder_helper(node, array)
  # Current, Left, Right
  return array if node.nil?

  array << {
    key: node.key,
    value: node.value
  }
  preorder_helper(node.left, array)
  preorder_helper(node.right, array)
end

def postorder_helper(node, array)
  # Left, Right, Current
  return array if node.nil?

  postorder_helper(node.left, array)
  postorder_helper(node.right, array)
  array << {
    key: node.key,
    value: node.value
  }
end

def height_helper(node)
  return 0 if node.nil?

  right_count = height_helper(node.right) + 1
  left_count = height_helper(node.left) + 1

  return [right_count, left_count].max
end