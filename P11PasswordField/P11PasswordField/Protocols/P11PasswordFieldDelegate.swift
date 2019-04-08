//
//  P11PasswordFieldDelegate.swift
//  P11PasswordField
//
//  Created by alvin joseph valdez on 07/04/2019.
//  Copyright © 2019 Novare Account. All rights reserved.
//

import UIKit

@objc public protocol P11PasswordFieldDelegate: class {
    @objc optional func onFocused(textField: UITextField, label: UILabel, horizontalLine: UIView)    
    @objc optional func outFocused(textField: UITextField, label: UILabel, horizontalLine: UIView)
    @objc optional func onReturn(textField: UITextField, label: UILabel, horizontalLine: UIView) -> Bool
}
