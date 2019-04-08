//
//  MainView.swift
//  P11PasswordField
//
//  Created by Novare Account on 29/03/2019.
//  Copyright © 2019 Novare Account. All rights reserved.
//

import UIKit
import SnapKit

public class MainView: UIView {
    
    // MARK: Subviews
    public let passwordField: P11PasswordField = {
        let view: P11PasswordField = P11PasswordField()
//        view.withAccessory(success: #imageLiteral(resourceName: "check-green-icon"))
//        view.withUpperCase()
//        view.with8Characters()
//        view.withSpecialCharacters()
//        view.withNumber()
//        view.setError(with: "Password Error")
        return view
    }()
    
    public let simpleTextField: UITextField = {
        let view: UITextField = UITextField()
        view.borderStyle = UITextField.BorderStyle.line
        return view
    }()
    
    public let button: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Click Me", for: UIControl.State.normal)
        view.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.passwordField, self.button,
            self.simpleTextField
        ])
        
        self.passwordField.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(120.0)
            make.leading.equalToSuperview().offset(30.0)
            make.trailing.equalToSuperview().inset(30.0)
            make.centerY.equalToSuperview()
        }
        
        self.button.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.passwordField.snp.bottom).offset(20.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(60.0)
            make.width.equalTo(100.0)
        }
        
        self.simpleTextField.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.button.snp.bottom).offset(20.0)
            make.height.equalTo(120.0)
            make.leading.equalToSuperview().offset(30.0)
            make.trailing.equalToSuperview().inset(30.0)
        }
        
        self.button.addTarget(
            self,
            action: #selector(MainView.buttonTapped),
            for: UIControl.Event.touchUpInside
        )
        
        self.passwordField.delegate = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Target Action Methods
extension MainView {
    
    @objc func buttonTapped() {
        self.passwordField.setError(with: "Error Password")
        print(self.passwordField.isPasswordValid())
    }
}

extension MainView: P11PasswordFieldDelegate {
    public func outFocused(textField: UITextField, label: UILabel, horizontalLine: UIView) {
        label.textColor = UIColor.lightGray
        horizontalLine.backgroundColor = UIColor.lightGray
    }

    public func onFocused(textField: UITextField, label: UILabel, horizontalLine: UIView) {
        label.textColor = UIColor.blue.withAlphaComponent(0.5)
        horizontalLine.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
    }
    
    public func onReturn(textField: UITextField, label: UILabel, horizontalLine: UIView) -> Bool {
        self.endEditing(true)
        return true
    }
    
}
