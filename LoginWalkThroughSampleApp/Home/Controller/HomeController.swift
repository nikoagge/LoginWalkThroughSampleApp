//
//  HomeController.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 09/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class HomeController: UIViewController {

    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //In order not to have gap between cells:
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    let cellIdentifier = "cellId"
    
    let pages: [PageModel] = {
        
        let homePage = PageModel(title: "Share a great book", message: "Feel free to send the books you want to the people you want. Every recipient's first book is free.", imageName: "page1")
        //In order to add a quote to a String, we should write it as this: \"your quoted string\"
        let infoAboutSendingFromLibraryOptionPage = PageModel(title: "Send book from your library", message: "Tap More menu next to any book. Choose \"Send this book\"", imageName: "page2")
        let infoAboutSendingFromPlayerOptionPage = PageModel(title: "Send from the player", message: "Tap More menu in the upper corner. Choose \"Send this book\"", imageName: "page3")
        
        return [homePage, infoAboutSendingFromLibraryOptionPage, infoAboutSendingFromPlayerOptionPage]
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        setupViews()
    }
    
    
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellIdentifier)
        //In order to every cell has its own page, and not to have two cells in one page:
        collectionView.isPagingEnabled = true
    }
    
    
    func setupViews() {
        
        view.addSubview(collectionView)
        
        //Set x, y, width, height for collectionView:
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

