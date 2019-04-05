//
//  P11TextField.swift
//  P11PasswordField
//
//  Created by Alvin Joseph Valdez on 29/03/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit
//swiftlint:disable file_length
public final class P11PasswordField: UIView {
    
    // MARK: Subviews
    private let passwordLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.medium)
        view.textColor = UIColor.black
        view.text = "Password"
        return view
    }()
    
    public let showPasswordButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("SHOW", for: UIControl.State.normal)
        let color = UIColor(red: 130.0/255.0, green: 154.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        view.setTitleColor(color, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        return view
    }()
    
    private lazy var mainTextField: PasswordField = {
        let view: PasswordField = PasswordField()
        view.isSecureTextEntry = true
        view.borderStyle = UITextField.BorderStyle.none
        view.font = UIFont.systemFont(ofSize: 16.0)
        let rightButton = self.showPasswordButton
        rightButton.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 30.0)
        view.rightViewMode = .always
        view.rightView = rightButton
        return view
    }()
    
    public let horizontalLineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    public let criteriaGreater8: CriteriaView = {
        let view: CriteriaView = CriteriaView()
        view.setCriteria(label: "Characters")
        return view
    }()
    
    public let criteriaUpperCase: CriteriaView = {
        let view: CriteriaView = CriteriaView()
        view.setCriteria(label: "UpperCase")
        view.setCriteriaTextIcon(with: "A")
        return view
    }()
    
    public let criteriaLowerCase: CriteriaView = {
        let view: CriteriaView = CriteriaView()
        view.setCriteria(label: "LowerCase")
        view.setCriteriaTextIcon(with: "a")
        return view
    }()
    
    public let criteriaNumber: CriteriaView = {
        let view: CriteriaView = CriteriaView()
        view.setCriteria(label: "Number")
        view.setCriteriaTextIcon(with: "1")
        return view
    }()
    
    public let criteriaSpecialCharacters: CriteriaView = {
        let view: CriteriaView = CriteriaView()
        view.setCriteria(label: "Special")
        view.setCriteriaTextIcon(with: "%$")
        return view
    }()
    
    private let errorMessageLabel: UILabel = {
        let view: UILabel = UILabel()
        view.textColor = UIColor.red.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()
    
    private let criteriaStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.alignment = UIStackView.Alignment.center
        view.distribution = UIStackView.Distribution.fillEqually
        return view
    }()
    
    // MARK: Stored Properties
    private var has8Characters: Bool = false {
        didSet {
            switch self.has8Characters {
            case true:
                if self.successAccessory != nil {
                    self.criteriaGreater8.criterialTextIcon.isHidden = true
                    self.criteriaGreater8.criteriaSuccessAccessory.isHidden = false
                } else {
                    self.criteriaGreater8.backgroundColor = UIColor.green.withAlphaComponent(0.5)
                }
            case false:
                switch self.successAccessory == nil {
                case true:
                    self.criteriaGreater8.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                case false:
                    self.criteriaGreater8.criterialTextIcon.isHidden = false
                    self.criteriaGreater8.criteriaSuccessAccessory.isHidden = true
                }
            }
        }
    }
    
    private var hasUpperCase: Bool = false {
        didSet {
            switch self.hasUpperCase {
            case true:
                if self.successAccessory != nil {
                    self.criteriaUpperCase.criterialTextIcon.isHidden = true
                    self.criteriaUpperCase.criteriaSuccessAccessory.isHidden = false
                } else {
                    self.criteriaUpperCase.backgroundColor = UIColor.green.withAlphaComponent(0.5)
                }
            case false:
                switch self.successAccessory == nil {
                case true:
                    self.criteriaUpperCase.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                case false:
                    self.criteriaUpperCase.criterialTextIcon.isHidden = false
                    self.criteriaUpperCase.criteriaSuccessAccessory.isHidden = true
                }
            }
        }
    }
    
    private var hasLowerCase: Bool = false {
        didSet {
            switch self.hasLowerCase {
            case true:
                if self.successAccessory != nil {
                    self.criteriaLowerCase.criterialTextIcon.isHidden = true
                    self.criteriaLowerCase.criteriaSuccessAccessory.isHidden = false
                } else {
                    self.criteriaLowerCase.backgroundColor = UIColor.green.withAlphaComponent(0.5)
                }
            case false:
                switch self.successAccessory == nil {
                case true:
                    self.criteriaLowerCase.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                case false:
                    self.criteriaLowerCase.criterialTextIcon.isHidden = false
                    self.criteriaLowerCase.criteriaSuccessAccessory.isHidden = true
                }
            }
        }
    }
    private var hasNumber: Bool = false {
        didSet {
            switch self.hasNumber {
            case true:
                if self.successAccessory != nil {
                    self.criteriaNumber.criterialTextIcon.isHidden = true
                    self.criteriaNumber.criteriaSuccessAccessory.isHidden = false
                } else {
                    self.criteriaNumber.backgroundColor = UIColor.green.withAlphaComponent(0.5)
                }
            case false:
                switch self.successAccessory == nil {
                case true:
                    self.criteriaNumber.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                case false:
                    self.criteriaNumber.criterialTextIcon.isHidden = false
                    self.criteriaNumber.criteriaSuccessAccessory.isHidden = true
                }
            }
        }
    }
    
    private var hasSpecialCharacters: Bool = false {
        didSet {
            switch self.hasSpecialCharacters {
            case true:
                if self.successAccessory != nil {
                    self.criteriaSpecialCharacters.criterialTextIcon.isHidden = true
                    self.criteriaSpecialCharacters.criteriaSuccessAccessory.isHidden = false
                } else {
                    self.criteriaSpecialCharacters.backgroundColor = UIColor.green.withAlphaComponent(0.5)
                }
            case false:
                switch self.successAccessory == nil {
                case true:
                    self.criteriaSpecialCharacters.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                case false:
                    self.criteriaSpecialCharacters.criterialTextIcon.isHidden = false
                    self.criteriaSpecialCharacters.criteriaSuccessAccessory.isHidden = true
                }
            }
        }
    }
    
    private var mustBe8Characters: Bool = false
    private var mustHaveUpperCase: Bool = false
    private var mustHaveLowerCase: Bool = false
    private var mustHaveNumber: Bool = false
    private var mustHaveSpecialCharacters: Bool = false
    
    private var criteriaValidationArray: [String: Bool] = [String: Bool]()
    
    private var successAccessory: UIImage!
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.mainTextField.delegate = self
        self.mainTextField.passwordfieldDelegate = self
        
        self.subviews(forAutoLayout: [
            self.passwordLabel, self.mainTextField,
            self.horizontalLineView, self.criteriaStackView
            ])
        
        self.passwordLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        self.mainTextField.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(10.0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.horizontalLineView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.0)
            make.top.equalTo(self.mainTextField.snp.bottom).offset(6.0)
        }
        
        self.criteriaStackView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.horizontalLineView.snp.bottom).offset(10.0)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.showPasswordButton.addTarget(
            self,
            action: #selector(P11PasswordField.showPasswordText),
            for: UIControl.Event.touchUpInside
        )

        self.mainTextField.addTarget(
            self,
            action: #selector(P11PasswordField.textFieldDidChanged),
            for: UIControl.Event.editingChanged
        )
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public APIs
extension P11PasswordField {
    
    public func with8Characters() {
        self.mustBe8Characters = true
        let criteria8CharactersView = self.criteriaGreater8
        
        if let accessory = self.successAccessory {
            criteria8CharactersView.setAccessory(accessory)
        }
        
        self.criteriaValidationArray[Criteria.with8Characters.rawValue] = false
        self.criteriaStackView.addArrangedSubview(criteria8CharactersView)
    }
    
    public func withUpperCase() {
        self.mustHaveUpperCase = true
        
        let criteriaUpperCaseView = self.criteriaUpperCase
        
        if let accessory = self.successAccessory {
            criteriaUpperCaseView.setAccessory(accessory)
        }
        
        self.criteriaValidationArray[Criteria.withUpperCase.rawValue] = false
        self.criteriaStackView.addArrangedSubview(criteriaUpperCaseView)
    }
    
    public func withLowerCase() {
        self.mustHaveLowerCase = true
        let criteriaLowerCaseView = self.criteriaLowerCase
        if let accessory = self.successAccessory {
            criteriaLowerCaseView.setAccessory(accessory)
        }
        self.criteriaValidationArray[Criteria.withLowerCase.rawValue] = false
        self.criteriaStackView.addArrangedSubview(criteriaLowerCaseView)
    }
    
    public func withNumber() {
        self.mustHaveNumber = true
        let criteriaNumberView = self.criteriaNumber
        if let accessory = self.successAccessory {
            criteriaNumberView.setAccessory(accessory)
        }
        self.criteriaValidationArray[Criteria.withNumber.rawValue] = false
        self.criteriaStackView.addArrangedSubview(criteriaNumberView)
    }
    
    public func withSpecialCharacters() {
        self.mustHaveSpecialCharacters = true
        let criteriaSpecialCharactersView = self.criteriaSpecialCharacters
        if let accessory = self.successAccessory {
            criteriaSpecialCharactersView.setAccessory(accessory)
        }
        self.criteriaValidationArray[Criteria.withSpecialCharacters.rawValue] = false
        self.criteriaStackView.addArrangedSubview(criteriaSpecialCharactersView)
    }
    
    public func withAccessory(success: UIImage) {
        self.successAccessory = success
    }
    
    public func withError(message: String) {
        self.errorMessageLabel.text = message
        self.errorMessageLabel.isHidden = false
        self.subview(forAutoLayout: self.errorMessageLabel)
        
        self.errorMessageLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.horizontalLineView.snp.bottom).offset(5.0)
            make.leading.equalTo(self.horizontalLineView.snp.leading)
        }
    }
    
    public func isPasswordValid() -> Bool {
        let validationArray: [Bool] = self.criteriaValidationArray.values.filter { $0 == false }
        
        if validationArray.first != nil {
            return false
        } else {
            return true
        }
    }
}

// MARK: - UITextFieldDelegate Methods
extension P11PasswordField: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        self.criteriaChecker(password: text)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        self.criteriaChecker(password: text)
        return true
    }
}

// MARK: - Target Action Methods
extension P11PasswordField {
    @objc func showPasswordText() {
        self.mainTextField.isSecureTextEntry.toggle()
        let isSecureEntry: Bool = self.mainTextField.isSecureTextEntry
        self.showPasswordButton.setTitle(isSecureEntry ? "SHOW": "HIDE", for: UIControl.State.normal)
    }

    @objc func textFieldDidChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        self.criteriaChecker(password: text)
    }
}

// MARK: - Helper Functions
extension P11PasswordField {
    
    private func doesHaveUpperCase(password: String) -> Bool {
        let upperCaseLetterRegEx  = ".*[A-Z]+.*"
        let textMatch = NSPredicate(format: "SELF MATCHES %@", upperCaseLetterRegEx)
        let upperCaseResult = textMatch.evaluate(with: password)
        return upperCaseResult
    }
    
    private func doesHaveLowerCase(password: String) -> Bool {
        let lowerCaseLetterRegEx  = ".*[a-z]+.*"
        let textMatch = NSPredicate(format: "SELF MATCHES %@", lowerCaseLetterRegEx)
        let lowerCaseResult = textMatch.evaluate(with: password)
        return lowerCaseResult
    }
    
    private func doesHaveNumber(password: String) -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let textMatch = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = textMatch.evaluate(with: password)
        return numberResult
    }
    
    private func doesHaveSpecialCharacters(password: String) -> Bool {
        let specialCharactersRegEx  = ".*[!&^%$#@()/]+.*"
        let textMatch = NSPredicate(format: "SELF MATCHES %@", specialCharactersRegEx)
        let specialCharactersResult = textMatch.evaluate(with: password)
        return specialCharactersResult
    }
    
    private func updateCriteriaValidation(of criterial: Criteria, with isValid: Bool) {
        switch self.criteriaValidationArray[criterial.rawValue] == nil {
        case true:
            break
        case false:
            self.criteriaValidationArray[criterial.rawValue] = isValid
        }
    }
    
    private func criteriaChecker(password: String) {
        
        switch password.count >= 8 && self.mustBe8Characters {
        case true:
            self.has8Characters = true
            self.updateCriteriaValidation(of: Criteria.with8Characters, with: true)
        case false:
            self.has8Characters = false
            self.updateCriteriaValidation(of: Criteria.with8Characters, with: false)
        }
        
        switch self.doesHaveUpperCase(password: password) && self.mustHaveUpperCase {
        case true:
            self.hasUpperCase = true
            self.updateCriteriaValidation(of: Criteria.withUpperCase, with: true)
        case false:
            self.hasUpperCase = false
            self.updateCriteriaValidation(of: Criteria.withUpperCase, with: false)
        }
        
        switch self.doesHaveLowerCase(password: password) && self.mustHaveLowerCase {
        case true:
            self.hasLowerCase = true
            self.updateCriteriaValidation(of: Criteria.withLowerCase, with: true)
        case false:
            self.hasLowerCase = false
            self.updateCriteriaValidation(of: Criteria.withLowerCase, with: false)
        }
        
        switch self.doesHaveNumber(password: password) && self.mustHaveNumber {
        case true:
            self.hasNumber = true
            self.updateCriteriaValidation(of: Criteria.withNumber, with: true)
        case false:
            self.hasNumber = false
            self.updateCriteriaValidation(of: Criteria.withNumber, with: false)
        }
        
        switch self.doesHaveSpecialCharacters(password: password) && self.mustHaveSpecialCharacters {
        case true:
            self.hasSpecialCharacters = true
            self.updateCriteriaValidation(of: Criteria.withSpecialCharacters, with: true)
        case false:
            self.hasSpecialCharacters = false
            self.updateCriteriaValidation(of: Criteria.withSpecialCharacters, with: false)
        }
    }
    
    private func resetBackground() {
        self.criteriaGreater8.backgroundColor = UIColor.clear
        self.criteriaUpperCase.backgroundColor = UIColor.clear
        self.criteriaLowerCase.backgroundColor = UIColor.clear
        self.criteriaNumber.backgroundColor = UIColor.clear
        self.criteriaSpecialCharacters.backgroundColor = UIColor.clear
    }
    
    private func hideAccessory() {
        self.criteriaGreater8.criteriaSuccessAccessory.isHidden = true
        self.criteriaUpperCase.criteriaSuccessAccessory.isHidden = true
        self.criteriaLowerCase.criteriaSuccessAccessory.isHidden = true
        self.criteriaNumber.criteriaSuccessAccessory.isHidden = true
        self.criteriaSpecialCharacters.criteriaSuccessAccessory.isHidden = true
        
        self.criteriaGreater8.criterialTextIcon.isHidden = false
        self.criteriaUpperCase.criterialTextIcon.isHidden = false
        self.criteriaLowerCase.criterialTextIcon.isHidden = false
        self.criteriaNumber.criterialTextIcon.isHidden = false
        self.criteriaSpecialCharacters.criterialTextIcon.isHidden = false
    }
}

// MARK: PasswordFieldDelegate Methods
extension P11PasswordField: PasswordFieldDelegate {
    fileprivate func textFieldDidDelete(textField: PasswordField) {
        
        guard let text = textField.text else { return }
        
        switch text.isEmpty {
        case true:
            self.resetBackground()
            if self.successAccessory != nil {
                self.hideAccessory()
            }
        case false:
            break
        }
    }
}

fileprivate protocol PasswordFieldDelegate: class { //swiftlint:disable:this private_over_fileprivate
    func textFieldDidDelete(textField: PasswordField)
}

fileprivate final class PasswordField: UITextField {
    // MARK: NumericTextFieldDelegate
    public weak var passwordfieldDelegate: PasswordFieldDelegate!
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func deleteBackward() {
        super.deleteBackward()
        if let delegate = self.passwordfieldDelegate {
            delegate.textFieldDidDelete(textField: self)
        }
    }
}

private enum Criteria: String {
    case with8Characters = "8Characters"
    case withUpperCase = "upperCase"
    case withLowerCase = "lowerCase"
    case withNumber = "number"
    case withSpecialCharacters = "specialCharacters"
}
