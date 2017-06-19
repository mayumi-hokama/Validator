//
//  ValidationRuleComposite.swift
//  Validator
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import Foundation

/// ruleを格納する配列を作る構造体
public struct ValidationRuleComposite<InputType> {
    
    // バリデーターをいれておく変数
    private var validators = [AnyValidationRule<InputType>]()
    
    public init() {
        
    }
    
    public init<R: ValidationRule>(rules: [R]) where R.InputType == InputType {
        self.validators = rules.map(AnyValidationRule.init)
    }
    
    public mutating func add<R: ValidationRule>(rule: R) where R.InputType == InputType {
        let anyRule = AnyValidationRule<InputType>(base: rule)
        validators.append(anyRule)
    }
    
    public func validate(_ value: InputType?) -> ValidationResult {
        
        for validator in validators {
            
            switch validator.validate(value) {
            case .valid:
                return .valid
            case .invalid(let error):
                return .invalid(of: error)
            }
        }
        
        return .invalid(of: CommonInputError.fatal)
    }
}

