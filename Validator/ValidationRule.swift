//
//  ValidationRule.swift
//  Validator
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import Foundation

// ValidationのRule
public protocol ValidationRule {
    associatedtype InputType
    func validate(_ value: InputType?) -> ValidationResult
}

/// いろんなruleを格納するstruct
struct AnyValidationRule<InputType>: ValidationRule {
    
    /// ValidationRuleのvalidateメソッドを格納しておく変数
    private let baseValidateInput: (_: InputType?) -> ValidationResult
    
    /// TODO: ここの意味わからん
    init<R: ValidationRule>(base: R) where R.InputType == InputType {
        baseValidateInput = base.validate
    }
    
    func validate(_ value: InputType?) -> ValidationResult {
        return baseValidateInput(value)
    }
}
