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
    
    // MARK: Subviews
    private let boxView: UIView = {
        let view: UIView = UIView()
        return view
    }()
    
    public let criterialTextIcon: UILabel = {
        let view: UILabel = UILabel()
        view.text = "8+"
        view.font = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.medium)
        return view
    }()
    
    public let criteriaSuccessAccessory: UIImageView = {
        let view: UIImageView = UIImageView()
        view.isHidden = true
        return view
    }()
    
    private let criteriaLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Criteria"
        view.font = UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight.regular)
        return view
    }()
    
    // MARK: Stored Properties
    private var successAccessory: UIImage! {
        didSet{
            self.criteriaSuccessAccessory.image = self.successAccessory
        }
    }
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.subviews(forAutoLayout: [
            self.boxView, self.criteriaLabel
        ])
        
        self.boxView.subviews(forAutoLayout: [
            self.criterialTextIcon, self.criteriaSuccessAccessory
        ])
        
        self.boxView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20.0)
        }
        
        self.criterialTextIcon.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.criteriaSuccessAccessory.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(25.0)
            make.width.equalTo(25.0)
            make.centerX.centerY.equalToSuperview()
        }

        self.criteriaLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.boxView.snp.bottom).offset(5.0)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public APIs
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
    
    public func setAccessory(_ accessory: UIImage) {
        self.successAccessory = accessory
    }
}
