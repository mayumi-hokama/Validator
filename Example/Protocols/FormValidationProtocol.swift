//
//  FormValidationProtocol.swift
//  Validator
//
//  Created by 外間麻友美 on 2017/06/19.
//  Copyright © 2017年 外間麻友美. All rights reserved.
//

import Foundation
import Validator

protocol FormValidationProtocol: class {
    func numberValid(min: Int, max: Int, text: String?) -> ValidationResult
    //    func checkValid(min: Int, max: Int, selectedCount: Int) -> ValidationResult
    //    func radioValid(selectedCount: Int, otherText: String?) -> ValidationResult
    //    func freeTextValid(text: String?) -> ValidationResult
    //    func checkMaxValid(max: Int, selectedCount: Int) -> ValidationResult
    //    func isMaxValid(max: Int, selectedCount: Int) -> ValidationResult
}

extension FormValidationProtocol {
    
    func numberValid(min: Int, max: Int, text: String?) -> ValidationResult {
        
        // バリデーターの生成
        // バリデートが増えた場合は、ここにそれ用のバリデーターを追加してください。
        var rules = ValidationRuleComposite<String>()
        // Ruleの生成
        let requiredRule = ValidationRuleRequired<String>(invalidError: NumberInputError.required)
        // add
        rules.add(rule: requiredRule)
                
        // バリデーションの実行
        return rules.validate(text)
    }
    /*
     func checkValid(min: Int, max: Int, selectedCount: Int) -> ValidationResult {
     
     // min/maxのチェック
     var min = min
     var max = max
     if min <= 0 {
     min = 1
     }
     if max <= 0 {
     max = selectedCount
     }
     
     // バリデーターの生成
     // バリデートが増えた場合は、ここにそれ用のバリデーターを追加してください。
     let validatorList: [Validator] = [
     // 必須か否かのチェック
     ValidationRequiredForNumber(invalidError: CheckInputError.required, required: required),
     // minのチェック
     ValidationMinimumForNumber(invalidError: CheckInputError.min(min), minimum: min),
     // maxのチェック
     ValidationMaximumForNumber(invalidError: CheckInputError.max(max), maximum: max)
     ]
     
     let validators = CompositeValidatorForNumber(validators: validatorList)
     
     // バリデーションの実行
     return validators.validate(selectedCount)
     
     }
     
     func radioValid(selectedCount: Int, otherText: String?) -> ValidationResult {
     
     // バリデーターの生成
     // バリデートが増えた場合は、ここにそれ用のバリデーターを追加してください。
     let validatorList: [Validator] = [
     ValidationRequiredForNumber(invalidError: RadioInputError.required, required: required),
     // ラジオだけ複雑使用のため特別
     ValidationRadio(other: other, otherText: otherText)
     ]
     
     let validators = CompositeValidatorForNumber(validators: validatorList)
     
     // バリデーションの実行
     return validators.validate(selectedCount)
     
     }
     
     func freeTextValid(text: String?) -> ValidationResult {
     
     // バリデーターの生成
     // バリデートが増えた場合は、ここにそれ用のバリデーターを追加してください。
     let validatorList: [Validator] = [
     // 必須か否かのチェック
     ValidationRequiredForText(invalidError: NumberInputError.required, required: required),
     ]
     
     let validators = CompositeValidatorForText(validators: validatorList)
     
     // バリデーションの実行
     return validators.validate(text)
     
     }
     
     func checkMaxValid(max: Int, selectedCount: Int) -> ValidationResult {
     
     // バリデーターの生成
     // バリデートが増えた場合は、ここにそれ用のバリデーターを追加してください。
     let validatorList: [Validator] = [
     // maxのチェック
     ValidationMaximumForNumber(invalidError: CheckInputError.max(max), maximum: max)
     ]
     
     let validators = CompositeValidatorForNumber(validators: validatorList)
     
     // バリデーションの実行
     return validators.validate(selectedCount)
     }
     
     func isMaxValid(max: Int, selectedCount: Int) -> ValidationResult {
     
     // バリデーターの生成
     // バリデートが増えた場合は、ここにそれ用のバリデーターを追加してください。
     let validatorList: [Validator] = [
     // maxのチェック
     ValidationIsMaxForNumber(invalidError: CheckInputError.max(max), maximum: max)
     ]
     
     let validators = CompositeValidatorForNumber(validators: validatorList)
     
     // バリデーションの実行
     return validators.validate(selectedCount)
     
     }
     */
}

