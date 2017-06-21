//: Playground - noun: a place where people can play

import UIKit

//  http://www.geeksforgeeks.org/full-and-complete-binary-tree-from-given-preorder-and-postorder-traversals/
//  Given two arrays that represent preorder and postorder traversals of a full binary tree, construct the binary tree.
//  A Full Binary Tree is a binary tree where every node has either 0 or 2 children
//  Example: Pre  = [1, 2, 4, 8, 9, 5, 3, 6, 7 ]
//           Post = [8, 9, 4, 5, 2, 6, 7, 3, 1 ]
//           Inorder Traversal of tree = [8, 4, 9, 2, 5, 1, 6, 3, 7 ]


class Node: CustomStringConvertible {
    
    var value: Int
    var left: Node?
    var right: Node?
    var next: Node?
    
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
































