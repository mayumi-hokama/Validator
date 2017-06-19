//
//  ValidationResult.swift
//  Validator
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import Foundation

/// Validationの結果enum
public enum ValidationResult {
    case valid
    case invalid(of: ValidationErrorType)
}

/// Validationエラープロトコル
public protocol ValidationErrorType: Error {
    var message: String { get }
}

enum CommonInputError: ValidationErrorType {
    case fatal
    
    var message: String {
        switch self {
        case .fatal:
            return "不正なエラーが発生しました。\n時間を置いて再度お試しください。"
        }
    }
}

public enum NumberInputError: ValidationErrorType {
    case required
    case min(Int)
    case max(Int)
    case format
    
    public var message: String {
        switch self {
        case .required:
            return "必須項目です。\n値を入力してください。"
        case .min(let num):
            return String(format: "%d以上で入力してください。", num)
        case .max(let num):
            return String(format: "%d以下で入力してください。", num)
        case .format:
            return "数値を入力してください。"
        }
    }
}

public enum CheckInputError: ValidationErrorType {
    case required
    case min(Int)
    case max(Int)
    
    public var message: String {
        switch self {
        case .required:
            return "必須項目です。\nいずれかを選択してください。"
        case .min(let num):
            return String(format: "最低%d個選択してください。", num)
        case .max(let num):
            return String(format: "%d個まで選択可能です。", num)
        }
    }
}
public enum RadioInputError: ValidationErrorType {
    case none
    case required
    case selected
    case orSelected
    case duplicated
    
    public var message: String {
        switch self {
        case .none:
            return ""
        case .required:
            return "必須項目です。\nいずれかを選択してください。"
        case .selected:
            return "いずれかを選択してください。"
        case .orSelected:
            return "いずれかを選択するか、入力項目に値を入力してください。"
        case .duplicated:
            return "選択値、入力値のいずれかをお選びください。"
        }
    }
}
public enum FreeTextInputError: ValidationErrorType {
    case none
    case required
    
    public var message: String {
        switch self {
        case .none:
            return ""
        case .required:
            return "必須項目です。\n値を入力してください。"
        }
    }
}
