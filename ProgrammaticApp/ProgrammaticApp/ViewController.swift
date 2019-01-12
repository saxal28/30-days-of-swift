//
//  ViewController.swift
//  ProgrammaticApp
//
//  Created by Alan Sax on 1/10/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // =================================
    // neat way to create UI element
    // =================================
    
    let topImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "gnome"))
        imageView.contentMode = .scaleAspectFit
        // --------------------------------------------
        // IMPORTANT: this enables autolayout for image view
        // (DO NOT FORGET OR ELSE IT WILL NOT WORK)
        // --------------------------------------------
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // --------------------------------------------
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
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // =================================
        //  Add to subview
        // =================================
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomControls()
        
    }
    
    private func setupLayout() {
        
        // IMAGE CONTAINER
        let topImageContainer = UIView()
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topImageContainer)
        topImageContainer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainer.addSubview(topImage)
        
        // IMAGE
        topImage.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        topImage.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        topImage.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
    
        
        // DESSCRIPTION TEXT
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        descriptionTextView.backgroundColor = UIColor.cyan

    }
    
    func setupBottomControls() {
        view.addSubview(previousButton)
        
        NSLayoutConstraint.activate([
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

