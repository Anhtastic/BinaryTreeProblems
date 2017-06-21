//: Playground - noun: a place where people can play

import UIKit

//  Create a function to count leaf nodes in a binary tree
//  Example: ((4) <- 2 -> (5)) <- 1 -> (3)
//  Output: 3

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
    
    
    private func countLeafNodes(root: Node?, result: inout Int) {
        
        if root == nil { return }
        
        if root?.left == nil && root?.right == nil {
            result += 1
        }
        
        countLeafNodes(root: root?.left, result: &result)
        countLeafNodes(root: root?.right, result: &result)
        
    }
    
    func countLeafNodes(root: Node?) -> Int {
        var result = 0
        countLeafNodes(root: root, result: &result)
        return result
    }
}


let tree = Node(value: 1)
tree.left = Node(value: 2)
tree.right = Node(value: 3)
tree.left?.left = Node(value: 4)
tree.left?.right = Node(value: 5)
print(tree)

let result = Result()
result.countLeafNodes(root: tree)











