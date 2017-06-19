//
//  ValidationRuleRequired.swift
//  Validator
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import Foundation

/// 必須チェック用のバリデータ
struct ValidationRuleRequired<T>: ValidationRule {
    
    typealias InputType = T
    
    private let invalidError: ValidationErrorType
    
    init(invalidError: ValidationErrorType) {
        self.invalidError = invalidError
    }
    
    func validate(_ value: InputType?) -> ValidationResult {
        
        if value != nil {
            return .valid
        }
        
        return .invalid(of: invalidError)
    }
}
