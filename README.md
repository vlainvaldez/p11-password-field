## P11PasswordField

> Password Field with Criteria Checker for user Sign Up

## Dependencies
-  [SnapKit](http://snapkit.io/)

### Demo
![alt text](https://github.com/vlainvaldez/DotStepIndicator/blob/stachViewImplementation/dottedStepIndicator.gif)

#### With Previous
![alt text](https://github.com/vlainvaldez/DotStepIndicator/blob/master/withPrevious.gif)

### How To Use


### Initialize

#### Without Success Accessory
```
    public let passwordField: P11PasswordField = {
        let view: P11PasswordField = P11PasswordField()
        view.withUpperCase()
        view.with8Characters()
        view.withSpecialCharacters()
        view.withNumber()        
        return view
    }()
```

#### Witho Success Accessory
```
    public let passwordField: P11PasswordField = {
        let view: P11PasswordField = P11PasswordField()
        view.withAccessory(success: #imageLiteral(resourceName: "check-green-icon"))
        view.with8Characters()
        view.withSpecialCharacters()
        view.withNumber()        
        return view
    }()
```

### Set the Constraints

```
 public override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.white
    
    self.subview(forAutoLayout: self.passwordField)
    
    self.passwordField.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
        make.height.equalTo(120.0)
        make.leading.equalToSuperview().offset(30.0)
        make.trailing.equalToSuperview().inset(30.0)
        make.centerY.equalToSuperview()
    }
}
```