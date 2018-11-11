class Tree
    attr_accessor :children, :node_name
    
    def initialize(name, children = [])
        @node_name = name
        @children = children
    end
    
    def self.fromHash(hash)
        name, childrenHash = hash.first
        children = childrenHash.map {|k,v| Tree.fromHash({k => v})}
        Tree.new(name, children)
    end
    
    def visit_all(&block)
        yield(self)
        children.each {|c| c.visit_all &block}
    end
    
    def visit(&block)
        block.call self
    end
end


#ruby_tree = Tree.new("Ruby",
#    [Tree.new("Reia"),Tree.new("MacRuby")])

ruby_tree_hash = Tree.fromHash({'grandpa'=>{'dad' => { 'child1' => {}, 'child2' => {}}, 'uncle' => {'child3'=> {}, 'child4' => {}}}})

puts "Visiting a node"
ruby_tree_hash.visit { |node| puts node.node_name }
puts

puts "visiting entire tree"
ruby_tree_hash.visit_all { |node| puts node.node_name}