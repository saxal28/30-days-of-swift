//
//  SwipingVC+extension.swift
//  ProgrammaticApp
//
//  Created by Alan Sax on 1/22/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

extension SwipingVC {
    
    // invalidates layout so it knows how to redraw itself
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            }
            
        }) { (_) in
            
        }
    }
}
