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
        view.with8Characters()
        view.withUpperCase()
        view.withLowerCase()
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subview(forAutoLayout: self.passwordField)
        
        self.passwordField.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(100.0)
            make.leading.equalToSuperview().offset(50.0)
            make.trailing.equalToSuperview().inset(50.0)
            make.centerY.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
