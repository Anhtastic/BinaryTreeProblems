//: Playground - noun: a place where people can play

import UIKit

//  http://www.geeksforgeeks.org/construct-a-special-tree-from-given-preorder-traversal/
//  Given an array ‘pre[]’ that represents Preorder traversal of a spacial binary tree where every node has either 0 or 2 children. One more array ‘preLN[]’ is given which has only two possible values ‘L’ and ‘N’. The value ‘L’ in ‘preLN[]’ indicates that the corresponding node in Binary Tree is a leaf node and value ‘N’ indicates that the corresponding node is non-leaf node. Write a function to construct the tree from the given two arrays.
//  Example: pre[] = [10, 30, 20, 5, 15], preLN[] = ["N", "N", "L", "L", "L"]


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
    
    func createSpecialTree(index: inout Int, pre: [Int], preLN: [String]) -> Node? {
        
        let currentIndex = index
        if index == pre.count { return nil }
        let root = Node(value: pre[index])
        index += 1
        
        if preLN[currentIndex] == "N" {
            root.left = createSpecialTree(index: &index, pre: pre, preLN: preLN)
            root.right = createSpecialTree(index: &index, pre: pre, preLN: preLN)
        }
        
        return root
    }
    
    func createSpecialTree(pre: [Int], preLN: [String]) -> Node? {
        if pre.isEmpty { return nil }
        if pre.count != preLN.count {
            print("pre and preLN needs to be equal")
            return nil
        }
        var index = 0
        return createSpecialTree(index: &index, pre: pre, preLN: preLN)
    }
    
}

let result = Result()
result.createSpecialTree(pre: [10, 30, 20, 5, 15], preLN: ["N", "N", "L", "L", "L"])

//let pre = [10, 30, 20, 5, 15, 50, 35]
//let preLN = ["N", "N", "N", "L", "L", "L", "L"]
//result.createSpecialTree(pre: pre, preLN: preLN)







