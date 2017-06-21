//: Playground - noun: a place where people can play

import UIKit

//  Write a function that returns true if the given Binary Tree is SumTree else false. A SumTree is a Binary Tree where the value of a node (the root only) is equal to sum of the nodes present in its left subtree and right subtree. An empty tree is SumTree and sum of an empty tree can be considered as 0. A leaf node is also considered as SumTree.

//  Example: ((4) <- 10 -> (6)) <- 26 -> (3 -> (3))
//  Result: Return true!

//  http://www.geeksforgeeks.org/check-if-a-given-binary-tree-is-sumtree/

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
    
    // Solution 1: O(n^2) time complexity for worst case if tree is a skewed tree (skewed tree: 1 -> 2 -> 3 -> 4 -> etc...)
    private func sum(root: Node?) -> Int {
        if root == nil { return 0 }
        return sum(root: root?.left) + root!.value + sum(root: root?.right)
    }
    
    func isSumTree(root: Node?) -> Bool {
        
        if root == nil || (root?.left == nil && root?.right == nil) { return true }
        
        let leftSubtreeSum = sum(root: root?.left)
        let rightSubtreeSum = sum(root: root?.right)
        if root!.value == leftSubtreeSum + rightSubtreeSum && isSumTree(root: root?.left) && isSumTree(root: root?.right) {
            return true
        }
        return false
    }
    
    
    // Solution 2: More efficient, O(n)
    private func isLeaf(node: Node?) -> Bool {
        if node == nil { return false }
        return node?.left == nil && node?.right == nil
    }
    
    
    func isSumTreeMoreEfficient(root: Node?) -> Bool {
        var leftSub: Int?
        var rightSub: Int?
        if root == nil || isLeaf(node: root) {
            return true
        }
        
        if isSumTreeMoreEfficient(root: root?.left) && isSumTreeMoreEfficient(root: root?.right) {
            if root?.left == nil {
                leftSub = 0
            } else if isLeaf(node: root?.left) {
                leftSub = (root?.left?.value)!
            } else {
                leftSub = 2 * (root?.left?.value)!
            }
            
            if root?.right == nil {
                rightSub = 0
            } else if isLeaf(node: root?.right) {
                rightSub = (root?.right?.value)!
            } else {
                rightSub = 2 * (root?.right?.value)!
            }
            
            if root!.value == leftSub! + rightSub! {
                return true
            } else {
                return false
            }
        }
        return false
    }

}

let result = Result()


//let root = Node(value: 26)
//root.left = Node(value: 10)
//root.right = Node(value: 3)
//root.left?.left = Node(value: 4)
//root.left?.right = Node(value: 6)
//root.right?.right = Node(value: 3)
//print(root)
//result.isSumTree(root: root)
//result.isSumTreeMoreEfficient(root: root)


let example = Node(value: 32)
example.left = Node(value: 16)
example.left?.left = Node(value: 8)
example.left?.left?.left = Node(value: 8)
print(example)
result.isSumTree(root: example)
result.isSumTreeMoreEfficient(root: example)


















