//: Playground - noun: a place where people can play

import UIKit
//  http://www.geeksforgeeks.org/find-the-maximum-sum-path-in-a-binary-tree/
//  Given a Binary Tree, find the maximum sum path from a leaf to root. For example, in the following tree, there are three leaf to root paths [[8] <- -2 -> [-4]] <- 10 -> [7] and 7 -> 10. The sums of these three paths are 16, 4 and 17 respectively. The maximum of them is 17 and the path for maximum is 7 -> 10.
//  Example: [[8] <- -2 -> [-4]] <- 10 -> [7]
//  Output: 17

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
    
    private func findMaxSumPath(root: Node?, currentSum: Int, result: inout Int, leaf: inout Node?) {
        if root == nil { return }
        var currentSum = currentSum
        currentSum += root!.value
        if currentSum > result {
            result = currentSum
            leaf = root
        }
        findMaxSumPath(root: root?.left, currentSum: currentSum, result: &result, leaf: &leaf)
        findMaxSumPath(root: root?.right, currentSum: currentSum, result: &result, leaf: &leaf)
    }
    
    func findMaxSumPath(root: Node?) -> Int?  {
        if root == nil { return nil }
        var result = Int()
        var leafWithMaxPath: Node?
        findMaxSumPath(root: root, currentSum: 0, result: &result, leaf: &leafWithMaxPath)
        var path = [Int]()
        findPath(root: root, leaf: leafWithMaxPath, path: &path)
        path.reverse()
        print("The path is: \(path)")
        return result
    }
    
    private func findPath(root: Node?, leaf: Node?, path: inout [Int]) -> Bool {
        if root == nil { return false }
        
        if root === leaf || findPath(root: root?.left, leaf: leaf, path: &path) || findPath(root: root?.right, leaf: leaf, path: &path) {
            path.append(root!.value)
            return true
        }
        return false
    }
}

let tree = Node(value: 10)
tree.left = Node(value: -2)
tree.right = Node(value: 7)
tree.left?.left = Node(value: 8)
tree.left?.right = Node(value: -4)
print(tree)

let result = Result()
result.findMaxSumPath(root: tree)



















































