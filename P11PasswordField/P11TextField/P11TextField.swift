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
    
    public let mainTextField: UITextField = {
        let view: UITextField = UITextField()
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
    
    private let greaterThan8Label: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 22.0, weight: UIFont.Weight.bold)
        view.textColor = UIColor.black
        view.text = "18+"
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.subviews(forAutoLayout: [
            self.passwordLabel, self.mainTextField,
            self.horizontalLineView, self.greaterThan8Label
        ])
        
        self.passwordLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        self.mainTextField.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.passwordLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.horizontalLineView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.0)
            make.centerY.equalTo(self.mainTextField.snp.bottom)
        }
        
        self.greaterThan8Label.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.horizontalLineView.snp.bottom).offset(20.0)
            make.leading.equalTo(self.mainTextField.snp.leading)
            make.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
