//: Playground - noun: a place where people can play

import UIKit

//  http://www.geeksforgeeks.org/vertical-sum-in-a-given-binary-tree/
//  Given a Binary Tree, find vertical sum of the nodes that are in same vertical line. Print all sums through different vertical lines.

//  Example: [[4] <- 2 -> [5]] <- 1 -> [[6] <- 3 -> [7]]
//  Vertical-Line-1 has only one node 4 => vertical sum is 4
//  Vertical-Line-2: has only one node 2=> vertical sum is 2
//  Vertical-Line-3: has three nodes: 1,5,6 => vertical sum is 1+5+6 = 12
//  Vertical-Line-4: has only one node 3 => vertical sum is 3
//  Vertical-Line-5: has only one node 7 => vertical sum is 7
//  Output: 4, 2, 12, 3 and 7



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
    private func verticalSum(root: Node?, horizontalDistance: Int, map: inout [Int: Int]) {
        if root == nil { return }
        
        if map[horizontalDistance] == nil {
            map[horizontalDistance] = root!.value
        } else {
            map[horizontalDistance]! += root!.value
        }
        
        verticalSum(root: root?.left, horizontalDistance: horizontalDistance - 1, map: &map)
        verticalSum(root: root?.right, horizontalDistance: horizontalDistance + 1, map: &map)
        
    }
    
    func verticalSum(root: Node?) {
        var map = [Int: Int]()
        verticalSum(root: root, horizontalDistance: 0, map: &map)
        if map.isEmpty { print("Empty tree") }
        var verticalLine = 1
        for (_,v) in map.sorted(by: <) {
            print("Vertical line: \(verticalLine): \(v)")
            verticalLine += 1
        }
    }
}

let tree = Node(value: 1)
tree.left = Node(value: 2)
tree.right = Node(value: 3)
tree.left?.left = Node(value: 4)
tree.left?.right = Node(value: 5)
tree.right?.left = Node(value: 6)
tree.right?.right = Node(value: 7)
print(tree)

let result = Result()
result.verticalSum(root: tree)
result.verticalSum(root: nil)































