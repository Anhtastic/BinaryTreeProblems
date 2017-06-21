//: Playground - noun: a place where people can play

import UIKit

//  Given a root of a tree, and an integer k. Print all the nodes which are at k distance from root.
//  Example:
//  ((4) <- 2 -> (5)) <- 1 -> ((8) <- 3)   -> root = 1, k  = 2
//  Result: 4, 5 & 8 are at distance 2 from root.

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
    
    private func printKthDistanceFromRoot(root: Node?, k: Int, result: inout String) {
        
        if root == nil || k < 0 { return }
        
        if k == 0 {
            result.append("\(root!.value), ")
            return
        }
        
        printKthDistanceFromRoot(root: root?.left, k: k - 1, result: &result)
        printKthDistanceFromRoot(root: root?.right, k: k - 1, result: &result)
    }
    
    func printKthDistanceFromRoot(root: Node?, k: Int) -> String {
        var result = String()
        printKthDistanceFromRoot(root: root, k: k, result: &result)
        return String(result.characters.dropLast(2)) // Get rid of the comma/space at the end.
    }
    
}

let tree = Node(value: 1)
tree.left = Node(value: 2)
tree.left?.left = Node(value: 4)
tree.left?.right = Node(value: 5)
tree.right = Node(value: 3)
tree.right?.left = Node(value: 8)
print(tree)

let result = Result()
result.printKthDistanceFromRoot(root: tree, k: 2)































