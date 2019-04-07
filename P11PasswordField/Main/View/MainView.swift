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
            self.passwordField, self.button
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
        
        self.button.addTarget(
            self,
            action: #selector(MainView.buttonTapped),
            for: UIControl.Event.touchUpInside
        )
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Target Action Methods
extension MainView {
    
    @objc func buttonTapped() {
        self.passwordField.setError(with: "Password error")        
        print(self.passwordField.isPasswordValid())
    }
}
