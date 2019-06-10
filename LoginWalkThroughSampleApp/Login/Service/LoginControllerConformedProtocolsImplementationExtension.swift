//
//  LoginControllerConformedProtocolsImplementationExtension.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 09/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import UIKit


extension LoginController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, LoginControllerDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == pages.count {
            
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellIdentifier, for: indexPath) as! LoginCell
            loginCell.loginControllerDelegate = self
            
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PageCell
        cell.page = pages[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    func finishLoggingIn() {
        
        //In order not only dismiss loginController, but also display homeController do this:
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        
        guard let mainNavigationController = rootViewController as? MainNavigationController else { return }
        mainNavigationController.viewControllers = [HomeController()]
        
        dismiss(animated: true, completion: nil)
    }
}
