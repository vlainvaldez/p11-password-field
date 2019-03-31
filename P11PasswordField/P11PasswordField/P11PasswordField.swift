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
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.subviews(forAutoLayout: [
            self.passwordLabel, self.mainTextField,
            self.horizontalLineView, self.criteriaStackView
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

// MARK: Public API's
extension P11PasswordField {
    
    public func has8Characters() {
        self.criteriaStackView.addArrangedSubview(self.criteriaGreater8)
    }
    
    public func hasUpperCase() {
        self.criteriaStackView.addArrangedSubview(self.criteriaUpperCase)
    }
    
    public func hasLowerCase() {
        self.criteriaStackView.addArrangedSubview(self.criteriaLowerCase)
    }
    
    public func hasNumber() {
        self.criteriaStackView.addArrangedSubview(self.criteriaNumber)
    }
    
}
