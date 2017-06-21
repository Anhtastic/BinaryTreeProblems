//: Playground - noun: a place where people can play

import UIKit

//  Given a Binary Tree where each node has positive and negative values. Convert this to a tree where each node contains the sum of the left and right sub trees in the original tree. The values of leaf nodes are changed to 0.
//  http://www.geeksforgeeks.org/convert-a-given-tree-to-sum-tree/
//  Example: 
//  Tree: [[8] <- -2 -> [-4]] <- 10 -> [[7] <- 6 -> [5]]
//  Output: [[0] <- 4 -> [0]] <- 20 -> [[0] <- 12 -> [0]]


class Node: CustomStringConvertible {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
    
    var description: String {
        var rval = ""
        if let left = left {
            rval += "[\(left.description)] <- "
        }
        rval += "\(value)"
        if let right = right {
            rval += " -> [\(right.description)]"
        }
        return rval
    }
    
}

class Result {
    
    private func isLeaf(root: Node?) -> Bool {
        return root?.left == nil && root?.right == nil
    }
    
    private func sumTrees(root: Node?) -> Int {
        if root == nil { return 0 }
        if isLeaf(root: root) { return 0 }
        let left = root?.left?.value ?? 0
        let right = root?.right?.value ?? 0
        let sum = left + right
        return sumTrees(root: root?.left)  +  sum + sumTrees(root: root?.right)
    }
    
    
    func convertToSumTree(root: Node?) -> Node? {
        if root == nil { return nil }
        let sum = sumTrees(root: root)
        convertToSumTree(root: root?.left)
        convertToSumTree(root: root?.right)
        root?.value = sum
        return root
    }
    
    
    // Solution 2: More efficient, doesn't use sumTrees as much. O(n) solution.
    func convertToSumTreeEfficient(root: Node?) -> Int {
        if root == nil { return 0 }
        let old_val = root!.value
        root?.value = convertToSumTreeEfficient(root: root?.left) + convertToSumTreeEfficient(root: root?.right)
        
        return (root?.value)! + old_val
    }
}

// Note: Since the nodes are value by reference, make sure to comment out one of the soln to get the desire result, otherwise one soln will act on the already changed tree.

let result = Result()

let tree = Node(value: 10)
tree.left = Node(value: -2)
tree.right = Node(value: 6)
tree.left?.left = Node(value: 8)
tree.left?.right = Node(value: -4)
tree.right?.left = Node(value: 7)
tree.right?.right = Node(value: 5)
print(tree)
//if let root = result.convertToSumTree(root: tree) {
//    print(root)
//}
//
result.convertToSumTreeEfficient(root: tree)
print(tree)
print("")

let tree2 = Node(value: 20)
tree2.left = Node(value: 5)
tree2.left?.left = Node(value: 1)
tree2.left?.left?.right = Node(value: -3)
tree2.right = Node(value: -5)
tree2.right?.left = Node(value: 8)
tree2.right?.left?.right = Node(value: 10)
print(tree2)
//if let root = result.convertToSumTree(root: tree2) {
//    print(root)
//}
result.convertToSumTreeEfficient(root: tree2)
print(tree2)






