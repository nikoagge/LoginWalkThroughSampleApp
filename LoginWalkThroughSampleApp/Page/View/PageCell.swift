//
//  PageCell.swift
//  LoginWalkThroughSampleApp
//
//  Created by Nikolas on 09/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class PageCell: UICollectionViewCell {
    
    
    let imageView: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "page1")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let textView: UITextView = {
       
        let tv = UITextView()
        tv.text = "Sample text"
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        //In order to push textView a little bit down:
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        
        let lsv = UIView()
        lsv.backgroundColor = UIColor(white: 0.9, alpha: 1)
        lsv.translatesAutoresizingMaskIntoConstraints = false
        
        return lsv
    }()
    
    var page: PageModel? {
        
        //Best practice to set cell's pageModel properties inside here:
        didSet {
            
            guard var safelyUnwrappedPage = page else { return }
            
            if UIDevice.current.orientation.isLandscape {
                
                safelyUnwrappedPage.imageName += "_landscape"
            }
            
            imageView.image = UIImage(named: safelyUnwrappedPage.imageName)
            
            let textColor = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: safelyUnwrappedPage.title, attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSMutableAttributedString.Key.foregroundColor: textColor])
            attributedText.append(NSAttributedString(string: "\n\n\(safelyUnwrappedPage.message)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: textColor]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textView.attributedText = attributedText
        }
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        //Set x, y, width, height constraints for imageView:
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        
        //Set x, y, width, height constraints for textView:
        textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        //Actually that means that the textView's height will be equal to 1/3 of cell's height:
        textView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
        //Set x, y, width, height constraints for lineSeparatorView:
        lineSeparatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineSeparatorView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        lineSeparatorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
