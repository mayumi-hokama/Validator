//
//  ValidationRuleRequired.swift
//  Validator
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import Foundation

/// 必須チェック用のバリデータ
public struct ValidationRuleRequired<T>: ValidationRule {
    
    public typealias InputType = T
    
    private let invalidError: ValidationErrorType
    
    public init(invalidError: ValidationErrorType) {
        self.invalidError = invalidError
    }
    
    public func validate(_ value: InputType?) -> ValidationResult {
        
        if value != nil {
            return .valid
        }
        
        return .invalid(of: invalidError)
    }
}
