//
//  MainNavigationController.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 10/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class MainNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        checkIfUserIsLoggedIn()
    }
    
    
    func checkIfUserIsLoggedIn() {
        
        if isUserLoggedIn() {
            
            let homeController = HomeController()
            
            viewControllers = [homeController]
        } else {
            
            //In order not to get this error: <LoginWalkThroughSampleApp.MainNavigationController: 0x7fd4f502b000> whose view is not in the window hierarchy!, write this:
            perform(#selector(presentLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    
    fileprivate func isUserLoggedIn() -> Bool {
        
        return false
    }
    
    
    @objc func presentLoginController() {
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
