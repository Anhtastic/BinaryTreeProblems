//: Playground - noun: a place where people can play

import UIKit

//  Question: Given a binary tree, find out if the tree can be folded or not.
//  A tree can be folded if left and right subtrees of the tree are structure wise mirror image of each other. An empty tree is considered as foldable.

//  Example Foldable Trees:
//  tree1: (7-> (9)) <-10-> ((11) <-15) = true
//  tree2: ((9) <-7) <-10-> (15-> (11)) = true

//  Example Unfoldable Trees:
//  tree3: (7-> (9)) <-10-> ((11) <-15) = false
//  tree4: ((9) <-7) <-10-> (15-> (11)) = false

// http://www.geeksforgeeks.org/foldable-binary-trees/

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
    
    // Solution 1
    private func convertToMirror(node: Node?) {
        if node == nil {
            return
        } else {
            convertToMirror(node: node?.left)
            convertToMirror(node: node?.right)
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
        }
    }
    
    private func isSameStruct(n1: Node?, n2: Node?) -> Bool {
        if n1 == nil && n2 == nil {
            return true
        } else if n1 != nil && n2 != nil && isSameStruct(n1: n1?.left, n2: n2?.left) && isSameStruct(n1: n1?.right, n2: n2?.right) {
            return true
        } else {
            return false
        }
    }
    
    func isFoldable(root: Node?) -> Bool {
        
        if root == nil { return true }
        
        convertToMirror(node: root?.left) // Convert left subtree to its mirror image
        
        let result = isSameStruct(n1: root?.left, n2: root?.right) // Compare the two trees if they're the same
        
        convertToMirror(node: root?.left) // Convert left subtree back to its original form
        
        return result
    }
    
    // Solution 2
    private func isFoldable(n1: Node?, n2: Node?) -> Bool {
        if n1 == nil && n2 == nil { return true }
        if n1 == nil || n2 == nil { return false }
        return isFoldable(n1: n1?.left, n2: n2?.right) && isFoldable(n1: n1?.right, n2: n2?.left)
    }
    
    func isFoldable2(root: Node?) -> Bool {
        
        if root == nil { return true }
        return isFoldable(n1: root?.left, n2: root?.right)

    }
}
let result = Result()
let tree1 = Node(value: 10)
tree1.left = Node(value: 7)
tree1.right = Node(value: 15)
tree1.left?.right = Node(value: 9)
tree1.right?.left = Node(value: 11)
print(tree1)
result.isFoldable(root: tree1)
result.isFoldable2(root: tree1)

let tree2 = Node(value: 10)
tree2.left = Node(value: 7)
tree2.right = Node(value: 15)
tree2.left?.left = Node(value: 9)
tree2.right?.right = Node(value: 11)
print(tree2)
result.isFoldable(root: tree2)
result.isFoldable2(root: tree2)

let tree3 = Node(value: 10)
tree3.left = Node(value: 7)
tree3.right = Node(value: 15)
tree3.left?.left = Node(value: 5)
tree3.right?.left = Node(value: 11)
print(tree3)
result.isFoldable(root: tree3)
result.isFoldable2(root: tree3)

let tree4 = Node(value: 10)
tree4.left = Node(value: 7)
tree4.right = Node(value: 15)
tree4.left?.left = Node(value: 9)
tree4.right?.left = Node(value: 12)
tree4.left?.right = Node(value: 10)
print(tree4)
result.isFoldable(root: tree4)
result.isFoldable2(root: tree4)










