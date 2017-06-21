//: Playground - noun: a place where people can play

import UIKit


//  http://www.geeksforgeeks.org/boundary-traversal-of-binary-tree/
//  Given a binary tree, print boundary nodes of the binary tree Anti-Clockwise starting from the root. For example, boundary traversal of the following tree is “20 8 4 10 14 25 22”
//  Example: [[4] <- 8 -> [[10] <- 12 -> [14]]] <- 20 -> [22 -> [25]]
//  Result: " 20 8 4 10 14 25 22 "

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

class Result {
    
    func printLeaves(root: Node?, result: inout String) {
        if root != nil {
            printLeaves(root: root?.left, result: &result)
            if root?.left == nil && root?.right == nil {
                result +=  "\(root!.value) -> "
            }
            printLeaves(root: root?.right, result: &result)
        }
    }
    
    func printBoundaryLeft(root: Node?, result: inout String) {
        if root != nil {
            if root?.left != nil {
                result +=  "\(root!.value) -> "
                printBoundaryLeft(root: root?.left, result: &result)
            } else if root?.right != nil {
                result +=  "\(root!.value) -> "
                printBoundaryLeft(root: root?.right, result: &result)
            }
        }
    }
    
    func printBoundaryRight(root: Node?, result: inout String) {
        if root != nil {
            if root?.right != nil {
                printBoundaryRight(root: root?.right, result: &result)
                result +=  "\(root!.value) -> "
            } else if root?.left != nil {
                printBoundaryRight(root: root?.left, result: &result)
                result +=  "\(root!.value) -> "
            }
        }
    }
    
    func printBoundary(root: Node?) -> String {
        var result = String()
        if root != nil {
            result +=  "\(root!.value) -> "
            printBoundaryLeft(root: root?.left, result: &result)
            printLeaves(root: root?.left, result: &result)
            printLeaves(root: root?.right, result: &result)
            printBoundaryRight(root: root?.right, result: &result)
        }
        return result
    }
    
}

let tree = Node(value: 20)
tree.left = Node(value: 8)
tree.left?.left = Node(value: 4)
tree.right = Node(value: 22)
tree.right?.left = Node(value: 50)
tree.right?.right = Node(value: 25)
tree.left?.right = Node(value: 12)
tree.left?.right?.left = Node(value: 10)
tree.left?.right?.right = Node(value: 14)
print(tree)

let result = Result()
print(result.printBoundary(root: tree))


























