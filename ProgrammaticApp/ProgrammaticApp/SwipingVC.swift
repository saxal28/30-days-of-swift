//
//  SwipingVC.swift
//  ProgrammaticApp
//
//  Created by Alan Sax on 1/11/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class SwipingVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let imageNames = ["gnome", "gnome_2", "gnome_3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    //Mark: Collection View
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? PageCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .gray
        print("cell", indexPath.row)
        cell?.topImage.image = UIImage(named: imageNames[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
