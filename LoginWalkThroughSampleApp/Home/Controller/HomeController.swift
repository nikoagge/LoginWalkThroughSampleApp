//
//  HomeController.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 09/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class HomeController: UIViewController {

    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //In order not to have gap between cells:
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor.rgb(ofRed: 247, ofGreen: 154, ofBlue: 27)
        pc.numberOfPages = self.pages.count + 1
        pc.translatesAutoresizingMaskIntoConstraints = false
        
        return pc
    }()
    
    let skipButton: UIButton = {
        
        let sb = UIButton(type: .system)
        sb.setTitle("Skip", for: .normal)
        sb.setTitleColor(UIColor.rgb(ofRed: 247, ofGreen: 154, ofBlue: 27), for: .normal)
        sb.translatesAutoresizingMaskIntoConstraints = false
        
        return sb
    }()
    
    let nextButton: UIButton = {
        
        let nb = UIButton(type: .system)
        nb.setTitle("Next", for: .normal)
        nb.setTitleColor(UIColor.rgb(ofRed: 247, ofGreen: 154, ofBlue: 27), for: .normal)
        nb.translatesAutoresizingMaskIntoConstraints = false
        
        return nb
    }()
    
    let cellIdentifier = "cellId"
    
    let loginCellIdentifier = "loginCellId"
    
    let pages: [PageModel] = {
        
        let homePage = PageModel(title: "Share a great book", message: "Feel free to send the books you want to the people you want. Every recipient's first book is free.", imageName: "page1")
        //In order to add a quote to a String, we should write it as this: \"your quoted string\"
        let infoAboutSendingFromLibraryOptionPage = PageModel(title: "Send book from your library", message: "Tap More menu next to any book. Choose \"Send this book\"", imageName: "page2")
        let infoAboutSendingFromPlayerOptionPage = PageModel(title: "Send from the player", message: "Tap More menu in the upper corner. Choose \"Send this book\"", imageName: "page3")
        
        return [homePage, infoAboutSendingFromLibraryOptionPage, infoAboutSendingFromPlayerOptionPage]
    }()
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        setupViews()
        
        observeKeyboardNotifications()
    }
    
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellIdentifier)
        //In order to every cell has its own page, and not to have two cells in one page:
        collectionView.isPagingEnabled = true
    }
    
    
    func setupViews() {
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        //Set x, y, width, height for collectionView:
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //Set x, y, width, height constraints for pageControl:
        pageControl.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        pageControlBottomAnchor = pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        pageControlBottomAnchor?.isActive = true
        pageControl.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Set x, y, width, height constraints for skipButton:
        skipButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16)
        skipButtonTopAnchor?.isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Set x, y, width, height constraints for nextButton:
        nextButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        nextButtonTopAnchor = nextButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16)
        nextButtonTopAnchor?.isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    private func observeKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIWindow.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillAppear() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //Move our view a little bit up so to not the keyboard hide the loginButton:
            self.view.frame = CGRect(x: 0, y: -50, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    @objc func keyboardWillHide() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //Keyboard is hiding and our view goes back to normal:
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    //In order to hide keyboard when scrolling back:
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        view.endEditing(true)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //In order to get the pageNumber use this calculation: targetContentOffset.pointee.x / view.frame.width
        let pageNumber = targetContentOffset.pointee.x / view.frame.width
        
        pageControl.currentPage = Int(pageNumber)
        
        //Check if we 're on the last page:
        if Int(pageNumber) == pages.count {
            
            //In order to hide pageControl on last page, I do this:
            pageControlBottomAnchor?.constant = 40
            skipButtonTopAnchor?.constant = -40
            nextButtonTopAnchor?.constant = -40
        } else {
            
            pageControlBottomAnchor?.constant = 0
            skipButtonTopAnchor?.constant = 16
            nextButtonTopAnchor?.constant = 16
        }
        
        //In order to make our animation a little bit faster:
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            //Everytime change a constraint constant, need to call this function:
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

