## P11PasswordField

> Password Field with Criteria Checker for user Sign Up

## Dependencies
-  [SnapKit](http://snapkit.io/)

### Demo
#### With Accessory
![alt text](https://github.com/vlainvaldez/p11-password-field/blob/master/gifs/P11PasswordFieldDemoWithAccessory.gif)

#### WithOut Accessory
![alt text](https://github.com/vlainvaldez/p11-password-field/blob/master/gifs/P11PasswordFieldDemoWithOutAccessory.gif)

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

#### With Success Accessory
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
#### NOTE:
> ```view.withAccessory(success: #imageLiteral(resourceName: "check-green-icon"))``` must be added before the criteria of password like what I did above


#### Check if Password is valid

```
// isPasswordValid return Bool
let passwordIsValid = self.passwordField.isPasswordValid()

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