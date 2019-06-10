//
//  LoginControllerDelegate.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 10/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation


//In order to can declare an instance of this variable as weak var, subclass this protocol as : class
protocol LoginControllerDelegate: class {
    
    
    func finishLoggingIn()
}
