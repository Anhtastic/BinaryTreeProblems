//: Playground - noun: a place where people can play

import UIKit

//  Write a program that converts a given tree to its Double tree. To create Double tree of the given tree, create a new duplicate for each node, and insert the duplicate as the left child of the original node.

//  Example: (1) <- 2 -> (3)
//  Output: (((1) <- 1) <- 2) <- 2 -> ((3) <- 3)
//  Example 2: ((4) <- 2 -> (5)) <- 1 -> (3)
//  Output: (((((4) <- 4) <- 2) <- 2 -> ((5) <- 5)) <- 1) <- 1 -> ((3) <- 3)

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
    
    func createDoubleTree(root: Node?) -> Node?  {
        
        if root == nil { return nil }
        
        createDoubleTree(root: root?.left)
        createDoubleTree(root: root?.right)
        
        let oldLeft = root?.left
        root?.left = Node(value: root!.value)
        root?.left?.left = oldLeft
        return root
    }
    
}

let tree = Node(value: 2)
tree.left = Node(value: 1)
tree.right = Node(value: 3)
print(tree)

let result = Result()
if let doubleTree = result.createDoubleTree(root: tree) {
    print(doubleTree)
}
print("\n")

let tree2 = Node(value: 1)
tree2.left = Node(value: 2)
tree2.right = Node(value: 3)
tree2.left?.left = Node(value: 4)
tree2.left?.right = Node(value: 5)
print(tree2)
if let doubleTree2 = result.createDoubleTree(root: tree2) {
    print(doubleTree2)
}











