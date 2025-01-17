//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 비모 on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty && !enqueueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
    func peek() -> Element? {
        enqueueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    mutating func removeAll() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
