//
//  ViewController.swift
//  ProgrammaticApp
//
//  Created by Alan Sax on 1/10/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

extension UIColor {
    static let mainRed = #colorLiteral(red: 1, green: 0.1294117647, blue: 0.003921568627, alpha: 1)
    static let mainRedLight = #colorLiteral(red: 1, green: 0.1294117647, blue: 0.003921568627, alpha: 0.3956817209)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
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

    }
    
}

