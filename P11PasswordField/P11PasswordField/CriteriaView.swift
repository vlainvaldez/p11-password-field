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
        view.text = "Criteria"
        view.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
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
        
        self.boxView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.criteriaLabel.snp.top)
        }
        
        self.criteriaLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
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
    
    
}
