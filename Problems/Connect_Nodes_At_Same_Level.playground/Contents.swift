//: Playground - noun: a place where people can play

import UIKit

//  Write a function to connect all the adjacent nodes at the same level in a binary tree using constant space.

// Example: ((4) <- 2 -> (5)) <- 1 -> (3 -> (6))
// http://www.geeksforgeeks.org/connect-nodes-at-same-level-with-o1-extra-space/

class Node: CustomStringConvertible {
    
    var left: Node?
    var right: Node?
    var nextRight: Node?
    var value: String
    
    init(value: String) {
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
    
    // This soln does a little bit of work because of looking for the first node at each level (firstNodeAtLevel method), thus it's O(n^2)
    private func firstNodeAtLevel(node: Node?, level: Int, currentLevel: inout Int) -> Node? {
        
        if node == nil || level > currentLevel { return nil }
        
        if level == currentLevel {
            return node
        } else {
            return firstNodeAtLevel(node: node?.left, level: level + 1, currentLevel: &currentLevel) ?? firstNodeAtLevel(node: node?.right, level: level + 1, currentLevel: &currentLevel)
        }
        
    }
    
    func connectAdjectNodes(root: Node?) {
        if root == nil { return }
        var currentLevel = 0
        var nextLevelNode = firstNodeAtLevel(node: root, level: 0, currentLevel: &currentLevel)
        
        while nextLevelNode != nil  {
            var temp: Node?
            var current = nextLevelNode
            while current != nil {
                let leftCurrent = current?.left
                let rightCurrent = current?.right
                
                if leftCurrent != nil {
                    temp?.nextRight = leftCurrent
                    temp = leftCurrent
                }
                if rightCurrent != nil {
                    temp?.nextRight = rightCurrent
                    temp = rightCurrent
                }
                current = current?.nextRight
            }
            currentLevel += 1
            nextLevelNode = firstNodeAtLevel(node: root, level: 0, currentLevel: &currentLevel)
        }
        
    }
    
    // Alternative Soln: More efficient O(n)
    // Recursive
    
    private func getNextRight(node: Node?) -> Node? {
        var temp = node?.nextRight
        while temp != nil {
            if temp?.left != nil {
                return temp?.left
            } else if temp?.right != nil {
                return temp?.right
            }
            temp = temp?.nextRight
        }
        return nil
    }
    func connectRecur(p: Node?) {
        if p == nil { return }
        if p?.nextRight != nil {
            connectRecur(p: p?.nextRight)
        }
        
        if p?.left != nil {
            if p?.right != nil {
                p?.left?.nextRight = p?.right
                p?.right?.nextRight = getNextRight(node: p)
            } else {
                p?.left?.nextRight = getNextRight(node: p)
            }
            connectRecur(p: p?.left)
        } else if p?.right != nil {
            p?.right?.nextRight = getNextRight(node: p)
            connectRecur(p: p?.right)
        } else {
            connectRecur(p: getNextRight(node: p))
        }
    }
    
    // Iterative soln from above.
    func connectIter(p: Node?) {
        var p = p
        if p == nil { return }
        p?.nextRight = nil
        
        while p != nil {
            var q = p
            while q != nil {
                if q?.left != nil {
                    if q?.right != nil {
                        q?.left?.nextRight = q?.right
                    } else {
                        q?.left?.nextRight = getNextRight(node: q)
                    }
                }
                
                if q?.right != nil {
                    q?.right?.nextRight = getNextRight(node: q)
                }
                q = q?.nextRight
            }
            
            if p?.left != nil {
                p = p?.left
            } else if p?.right != nil {
                p = p?.right
            } else {
                p = getNextRight(node: p)
            }
        }
    }
    
    
    
    // Convert each level adjacent nodes to string.
    func convertResultToString(root: Node?) -> String {
        var rval = "["
        var currentLevel = 1
        var node = root
        while node != nil {
            rval += "["
            var currentNode = node
            while currentNode != nil {
                rval += "\(currentNode!.value) -> "
                currentNode = currentNode?.nextRight
            }
            rval += "], "
            node = firstNodeAtLevel(node: root, level: 0, currentLevel: &currentLevel)
            currentLevel += 1
        }
        return rval + "]"
    }
    
}

// Note: make sure to commented out previous approach before trying new soln because the tree is reference type, not value type.

let result = Result()

//let tree = Node(value: "A")
//tree.left = Node(value: "B")
//tree.right = Node(value: "C")
//tree.left?.left = Node(value: "D")
//tree.left?.right = Node(value: "E")
//tree.right?.right = Node(value: "F")
//print(tree)
//result.connectAdjectNodes(root: tree)
//result.connectRecur(p: tree)
//result.connectIter(p: tree)
//result.convertResultToString(root: tree)


//let tree2 = Node(value: "A")
//tree2.left = Node(value: "B")
//tree2.right = Node(value: "C")
//tree2.right?.left = Node(value: "D")
//tree2.right?.right = Node(value: "E")
//print(tree2)
//result.connectAdjectNodes(root: tree2)
//result.connectRecur(p: tree2)
//result.connectIter(p: tree2)
//result.convertResultToString(root: tree2)

//let tree3 = Node(value: "10")
//tree3.left = Node(value: "8")
//tree3.right = Node(value: "2")
//tree3.left?.left = Node(value: "3")
//tree3.right?.right = Node(value: "90")
//print(tree3)
//result.connectAdjectNodes(root: tree3)
//result.connectRecur(p: tree3)
//result.connectIter(p: tree3)
//result.convertResultToString(root: tree3)


//let tree4 = Node(value: "1")
//tree4.left = Node(value: "2")
//tree4.right = Node(value: "3")
//tree4.left?.left = Node(value: "4")
//tree4.left?.right = Node(value: "5")
//tree4.right?.left = Node(value: "6")
//tree4.right?.right = Node(value: "7")
//tree4.left?.left?.left = Node(value: "8")
//tree4.left?.left?.right = Node(value: "9")
//tree4.right?.right?.left = Node(value: "10")
//tree4.right?.right?.right = Node(value: "11")
//print(tree4)
//result.connectAdjectNodes(root: tree4)
//result.connectRecur(p: tree4)
//result.connectIter(p: tree4)
//result.convertResultToString(root: tree4)




