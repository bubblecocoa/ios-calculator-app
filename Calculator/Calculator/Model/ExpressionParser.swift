//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 비모 on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input)
            .map { $0.components(separatedBy: ",").joined() }
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0) }
        
        input
            .compactMap { Operator(rawValue: $0) }
            .forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var components: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            components = components.flatMap { component in
                component.split(with: `operator`.rawValue)
            }
        }
        
        return components
    }
}
