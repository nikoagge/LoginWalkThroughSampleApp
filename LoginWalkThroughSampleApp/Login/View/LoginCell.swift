//
//  LoginCell.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 09/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class LoginCell: UICollectionViewCell {

    
    let logoImageView: UIImageView = {
        
        let liv = UIImageView()
        liv.image = UIImage(named: "logo")
        liv.translatesAutoresizingMaskIntoConstraints = false
        
        return liv
    }()
    
    let emailTextField: LeftPaddedTextField = {
        
        let etf = LeftPaddedTextField()
        etf.placeholder = "Enter email"
        //In order to have a little border arount textField write the following two lines of code:
        etf.layer.borderColor = UIColor.lightGray.cgColor
        etf.layer.borderWidth = 1
        etf.keyboardType = .emailAddress
        etf.translatesAutoresizingMaskIntoConstraints = false
        
        return etf
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        
        let ptf = LeftPaddedTextField()
        ptf.placeholder = "Enter password"
        //In order to have a little border arount textField write the following two lines of code:
        ptf.layer.borderColor = UIColor.lightGray.cgColor
        ptf.layer.borderWidth = 1
        ptf.isSecureTextEntry = true
        ptf.translatesAutoresizingMaskIntoConstraints = false
        
        return ptf
    }()
    
    lazy var loginButton: UIButton = {
        
        let lb = UIButton(type: .system)
        lb.backgroundColor = .orange
        lb.setTitle("Log in", for: .normal)
        lb.setTitleColor(.white, for: .normal)
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        lb.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return lb
    }()
    
    var loginController: LoginController?
    
    //In order to avoid having a retain cycle, declare loginControllerDelegate as a weak var:
    weak var loginControllerDelegate: LoginControllerDelegate?
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        //Set x, y, width, height constraints for logoImageView:
        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        let distanceFromCenterYAnchor: CGFloat = UIDevice.current.orientation.isLandscape ? -130 : -220
        
        logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: distanceFromCenterYAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        //Set x, y, width, height constraints for emailTextField:
        emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32).isActive = true
        emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -32).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Set x, y, width, height constraints for passwordTextField:
        passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Set x, y, width, height constraints for loginButton:
        loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func loginButtonTapped() {
        
        loginControllerDelegate?.finishLoggingIn()
    }
}
