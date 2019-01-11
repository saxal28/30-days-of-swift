//
//  ViewController.swift
//  DownloadingImagesFromWeb
//
//  Created by Alan Sax on 1/10/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://i.imgur.com/vLd4TQv.jpg")!
        let request = NSMutableURLRequest(url: url) as URLRequest
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if error != nil {
                print(error!)
            } else {
                if let img = UIImage(data: data!) {
                    
                    self.image.image = img
                    
                    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                    
                    if documentsPath.count > 0 {
                        if let documentDirectory = documentsPath[0] as? String {
                            let savePath = documentDirectory + "/bach.jpg"
                            
                            do {
                                try UIImageJPEGRepresentation(img, 1)?.write(to: URL(fileURLWithPath: savePath))

                            } catch {
                                print("error")
                            }
                            
                        }
                    }
                    
                }
            }
        }
        
        task.resume()
        
    }

}

