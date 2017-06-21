//: Playground - noun: a place where people can play

import UIKit

//  Given a binary tree, print all nodes that are full nodes. Full Nodes are nodes which has both left and right children as non-empty.

// Example: ((3) <- 8 -> (5)) <- 10 -> ((7) <- 2)
// Output: 10 8

// Example2: (2) <- 1 -> ((4) <- 3 -> (6))
// Output: 1 3


class Node: CustomStringConvertible {
    
    var left: Node?
    var right: Node?
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    
    var description: String {
        var rval = ""
        if let left = left {
            rval += "(\(left.description)) <- "
        }
        rval += "\(value)"
        if let right = right {
            rval += " -> (\(right.description))"
        }
        return rval
    }
    
}

class Result {
    
    func printFullNodes(root: Node?) -> String {
        
        if root == nil { return "" }
        
        var result = ""
        if root?.left != nil && root?.right != nil {
            result += "\(root!.value) "
        }
        
        result += printFullNodes(root: root?.left)
        result += printFullNodes(root: root?.right)
        return result
    }
    
    
}


let tree = Node(value: 10)
tree.left = Node(value: 8)
tree.left?.left = Node(value: 3)
tree.left?.right = Node(value: 5)
tree.right = Node(value: 2)
tree.right?.left = Node(value: 7)
print(tree)

let tree2 = Node(value: 1)
tree2.left = Node(value: 2)
tree2.right = Node(value: 3)
tree2.right?.left = Node(value: 4)
tree2.right?.right = Node(value: 6)
print(tree2)

let result = Result()
result.printFullNodes(root: tree)
result.printFullNodes(root: tree2)




























