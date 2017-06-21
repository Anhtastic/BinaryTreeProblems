//: Playground - noun: a place where people can play

import UIKit

//  http://www.geeksforgeeks.org/construct-binary-tree-from-inorder-traversal/
//  Given Inorder Traversal of a Special Binary Tree in which key of every node is greater than keys in left and right children, construct the Binary Tree and return root.
//  Example:
//  Input: inorder[] = {5, 10, 40, 30, 28}
//  Output: [[5] <- 10] <- 40 -> [30 -> [28]]
//  Example 2:
//  Input: [1, 5, 10, 40, 30, 15, 28, 20]
//  Output: [[[1] <- 5] <- 10] <- 40 -> [30 -> [[15] <- 28 -> [20]]]

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
    
    // Time complexity: O(n^2)
    private func findMaxIndex(arr: [Int], start: Int, end: Int) -> Int {
        var max = arr[start]
        var maxIndex = start
        if start == end { return maxIndex }
        for i in (start + 1) ... end {
            if arr[i] > max {
                max = arr[i]
                maxIndex = i
            }
        }
        return maxIndex
    }
    
    private func createBinaryTree(arr: [Int], start: Int, end: Int) -> Node? {
        
        if start > end { return nil  }
        let maxIndex = findMaxIndex(arr: arr, start: start, end: end)
        let maxValue = arr[maxIndex]
        let root = Node(value: maxValue)
        root.left = createBinaryTree(arr: arr, start: start, end: maxIndex - 1)
        root.right = createBinaryTree(arr: arr, start: maxIndex + 1, end: end)
        return root
    }
    
    func createBinaryTree(arr: [Int]) -> Node? {
        return createBinaryTree(arr: arr, start: 0, end: arr.count - 1)
    }

}


let result = Result()
let arr = [5, 10, 40, 30, 28]
result.createBinaryTree(arr: arr)


let arr2 = [1, 5, 10, 40, 30, 15, 28, 20]
result.createBinaryTree(arr: arr2)








