//
//  ViewController.swift
//  AccessCameraRoll
//
//  Created by Alan Sax on 3/9/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.setTitle("Access Camera Roll", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(handleCameraPress), for: .touchUpInside)
        return button
    }()
    
    let previewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(previewImage)
        view.addSubview(button)

        previewImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        previewImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        previewImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        previewImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        button.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func handleCameraPress() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            previewImage.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }


}

