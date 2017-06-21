//: Playground - noun: a place where people can play

import UIKit

//  Find the Deepest Node in a Binary Tree
//  Given a binary tree, find the deep­est node in it.
//  Example: ((4) <- 2 -> (5)) <- 1 -> ((6) <- 3 -> (7 -> (8)))
//  Solution: 8
//  Example 2: (2) <- 1 -> ((6) <- 3)
//  Solution: 6


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
    
    func findDeepestNode(root: Node?, currentLevel: Int, maxLevel: inout Int, result: inout Node?) {
        
        if root == nil { return }
        
        if currentLevel > maxLevel {
            result = root
            maxLevel += 1
        }
        findDeepestNode(root: root?.left, currentLevel: currentLevel + 1, maxLevel: &maxLevel, result: &result)
        findDeepestNode(root: root?.right, currentLevel: currentLevel + 1, maxLevel: &maxLevel, result: &result)
        
    }
    
    func findDeepestNode(root: Node?) -> Node? {
        var maxLevel = -1
        var result: Node?
        findDeepestNode(root: root, currentLevel: 0, maxLevel: &maxLevel, result: &result)
        return result
    }
    
}

let tree = Node(value: 1)
tree.left = Node(value: 2)
tree.right = Node(value: 3)
tree.left?.left = Node(value: 4)
tree.left?.right = Node(value: 5)
tree.right?.left = Node(value: 6)
tree.right?.right = Node(value: 7)
tree.right?.right?.right = Node(value: 8)
print(tree)


let tree2 = Node(value: 1)
tree2.left = Node(value: 2)
tree2.right = Node(value: 3)
tree2.right?.left = Node(value: 6)
print(tree2)

let result = Result()
result.findDeepestNode(root: tree2)
result.findDeepestNode(root: tree)













