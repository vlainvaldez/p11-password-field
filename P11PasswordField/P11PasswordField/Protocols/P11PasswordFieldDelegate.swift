//
//  P11PasswordFieldDelegate.swift
//  P11PasswordField
//
//  Created by alvin joseph valdez on 07/04/2019.
//  Copyright © 2019 Novare Account. All rights reserved.
//

import UIKit

public protocol P11PasswordFieldDelegate: class {
    func onFocused(textField: UITextField, label: UILabel, horizontalLine: UIView)
    func outFocused(textField: UITextField, label: UILabel, horizontalLine: UIView)
    func onReturn(textField: UITextField, label: UILabel, horizontalLine: UIView) -> Bool
}

extension P11PasswordFieldDelegate {    
    public func onFocused(textField: UITextField, label: UILabel, horizontalLine: UIView) {}
    public func outFocused(textField: UITextField, label: UILabel, horizontalLine: UIView) {}
    public func onReturn(textField: UITextField, label: UILabel, horizontalLine: UIView) -> Bool {
        return true
    }
}
