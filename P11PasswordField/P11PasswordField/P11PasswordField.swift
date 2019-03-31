//
//  P11TextField.swift
//  P11PasswordField
//
//  Created by Novare Account on 29/03/2019.
//  Copyright © 2019 Novare Account. All rights reserved.
//

import UIKit
import SnapKit

public final class P11PasswordField: UIView {
    
    // MARK: Subviews
    private let passwordLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.medium)
        view.textColor = UIColor.black
        view.text = "Password"
        return view
    }()
    
    private let mainTextField: PasswordField = {
        let view: PasswordField = PasswordField()
        view.isSecureTextEntry = true
        view.borderStyle = UITextField.BorderStyle.none
        view.font = UIFont.systemFont(ofSize: 16.0)
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
    
    private let criteriaStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.alignment = UIStackView.Alignment.center
        view.distribution = UIStackView.Distribution.fillEqually
        return view
    }()
    
    private var has8Characters: Bool = false {
        didSet {
            switch self.has8Characters {
            case true:
                self.criteriaGreater8.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            case false:
                self.criteriaGreater8.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            }
        }
    }
    
    private var hasUpperCase: Bool = false {
        didSet {
            switch self.hasUpperCase {
            case true:
                self.criteriaUpperCase.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            case false:
                self.criteriaUpperCase.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            }
        }
    }
    private var hasLowerCase: Bool = false {
        didSet {
            switch self.hasLowerCase {
            case true:
                self.criteriaLowerCase.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            case false:
                self.criteriaLowerCase.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            }
        }
    }
    private var hasNumber: Bool = false {
        didSet {
            switch self.hasNumber {
            case true:
                self.criteriaNumber.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            case false:
                self.criteriaNumber.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            }
        }
    }
    
    private var mustBe8Characters: Bool = false
    private var mustHaveUpperCase: Bool = false
    private var mustHaveLowerCase: Bool = false
    private var mustHaveNumber: Bool = false
    
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
            make.centerY.equalTo(self.mainTextField.snp.bottom)
        }
        
        self.criteriaStackView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.horizontalLineView.snp.bottom).offset(10.0)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public APIs
extension P11PasswordField {
    
    public func with8Characters() {
        self.mustBe8Characters = true
        self.criteriaStackView.addArrangedSubview(self.criteriaGreater8)
    }
    
    public func withUpperCase() {
        self.mustHaveUpperCase = true
        self.criteriaStackView.addArrangedSubview(self.criteriaUpperCase)
    }
    
    public func withLowerCase() {
        self.mustHaveLowerCase = true
        self.criteriaStackView.addArrangedSubview(self.criteriaLowerCase)
    }
    
    public func withNumber() {
        self.mustHaveNumber = true
        self.criteriaStackView.addArrangedSubview(self.criteriaNumber)
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


// MARK: - Helper Functions
extension P11PasswordField {
    
    private func doesHaveUpperCase(password: String) -> Bool {
        let upperCaseLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", upperCaseLetterRegEx)
        let upperCaseResult = texttest.evaluate(with: password)
        return upperCaseResult
    }
    
    private func doesHaveLowerCase(password: String) -> Bool {
        let lowerCaseLetterRegEx  = ".*[a-z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", lowerCaseLetterRegEx)
        let lowerCaseResult = texttest.evaluate(with: password)
        return lowerCaseResult
    }
    
    private func doesHaveNumber(password: String) -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberResult = texttest.evaluate(with: password)
        return numberResult
    }
    
    private func criteriaChecker(password: String) {
        
        switch password.count >= 8 && self.mustBe8Characters {
        case true:
            self.has8Characters = true
        case false:
            self.has8Characters = false
        }
        
        switch self.doesHaveUpperCase(password: password) && self.mustHaveUpperCase {
        case true:
            self.hasUpperCase = true
        case false:
            self.hasUpperCase = false
        }
        
        switch self.doesHaveLowerCase(password: password) && self.mustHaveLowerCase {
        case true:
            self.hasLowerCase = true
        case false:
            self.hasLowerCase = false
        }
        
        switch self.doesHaveNumber(password: password) && self.mustHaveNumber {
        case true:
            self.hasNumber = true
        case false:
            self.hasNumber = false
        }
    }
    
    private func resetBackground() {
        self.criteriaGreater8.backgroundColor = UIColor.clear
        self.criteriaUpperCase.backgroundColor = UIColor.clear
        self.criteriaLowerCase.backgroundColor = UIColor.clear
        self.criteriaNumber.backgroundColor = UIColor.clear
    }
}

// MARK: PasswordFieldDelegate Methods
extension P11PasswordField: PasswordFieldDelegate {
    fileprivate func textFieldDidDelete(textField: PasswordField) {
        
        guard let text = textField.text else { return }
        
        switch text.isEmpty {
        case true:
            self.resetBackground()
        case false:
            break
        }
        
    }
}

fileprivate protocol PasswordFieldDelegate: class {
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
