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
    
    public let criteriaGreater8: CriteriaView = {
        let view: CriteriaView = CriteriaView()
         view.setCriteria(label: "Characters")
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.subviews(forAutoLayout: [
            self.passwordLabel, self.mainTextField,
            self.horizontalLineView, self.criteriaGreater8
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
        
        self.criteriaGreater8.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.horizontalLineView.snp.bottom)
            make.leading.equalTo(self.mainTextField.snp.leading)
            make.height.equalTo(50.0)
            make.width.equalTo(50.0)
            make.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
