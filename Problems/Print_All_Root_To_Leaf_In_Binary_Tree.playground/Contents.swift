//: Playground - noun: a place where people can play

import UIKit


//  Given a binary tree, print out all of its root-to-leaf paths one per line.
//  Example: ((4) <- 2 -> (5)) <- 1 -> (3)
//  Output: 1 2 4
//          1 2 5
//          1 3

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
    
    private func printRootToLeaf(root: Node?, result: String) {
        
        if root == nil { return }
        
        var result = result
        result += "\(root!.value) "
        
        if root?.left == nil && root?.right == nil {
            print(result)
        }
        
        printRootToLeaf(root: root?.left, result: result)
        printRootToLeaf(root: root?.right, result: result)
    }
    
    func printRootToLeaf(root: Node?) {
        printRootToLeaf(root: root, result: "")
    }
    
}




let tree = Node(value: 1)
tree.left = Node(value: 2)
tree.right = Node(value: 3)
tree.left?.left = Node(value: 4)
tree.left?.right = Node(value: 5)
print(tree)

let result = Result()
result.printRootToLeaf(root: tree)







































