//
//  PageCell.swift
//  ProgrammaticApp
//
//  Created by Alan Sax on 1/12/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let topImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "gnome"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join Us Today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for load and loads of fun? We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        // IMAGE CONTAINER
        let topImageContainer = UIView()
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topImageContainer)
        topImageContainer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.addSubview(topImage)
        
        // IMAGE
        topImage.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        topImage.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        topImage.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        
        // DESSCRIPTION TEXT
        self.addSubview(descriptionTextView)
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
    }
}
