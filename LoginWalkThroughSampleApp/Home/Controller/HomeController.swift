//
//  HomeController.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 10/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class HomeController: UIViewController {

    
    let imageView: UIImageView = {
        
        let iv = UIImageView(image: UIImage(named: "home"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    func setupViews() {
        
        view.addSubview(imageView)
        
        //Set x, y, width, height constraints for imageView:
        imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
