//
//  CriteriaView.swift
//  P11PasswordField
//
//  Created by Novare Account on 29/03/2019.
//  Copyright © 2019 Novare Account. All rights reserved.
//

import UIKit
import SnapKit

public class CriteriaView: UIView {
    
    private let boxView: UIView = {
        let view: UIView = UIView()
        return view
    }()
    
    private let criterialTextIcon: UILabel = {
        let view: UILabel = UILabel()
        view.text = "8+"
        view.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.medium)
        return view
    }()
    
    private let criteriaLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Criteria"
        view.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
        return view
    }()
    
    // Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subviews(forAutoLayout: [
            self.boxView, self.criteriaLabel
        ])
        
        self.boxView.subview(forAutoLayout: self.criterialTextIcon)
        
        self.boxView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        self.criterialTextIcon.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerX.centerY.equalToSuperview()
        }

        self.criteriaLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.boxView.snp.bottom).offset(20.0)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CriteriaView {
    
    public func setCriteria(label: String) {
        self.criteriaLabel.text = label
    }
    
    public func setCriteriaTextIcon(with label: String) {
        switch label.count >= 1 || label.count <= 2 {
        case true:
            self.criterialTextIcon.text = label
        case false:
            break
        }
    }
}
