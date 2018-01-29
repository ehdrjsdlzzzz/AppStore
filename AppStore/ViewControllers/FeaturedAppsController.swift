//
//  FeaturedAppsController.swift
//  AppStore
//
//  Created by 이동건 on 2018. 1. 29..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class FeaturedAppsController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var appCategories: [AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        title = "AppStore"
        AppCategory.fetchFeaturedApps { (appCategories) in
            self.appCategories = appCategories
            self.collectionView.reloadData()
        }
        
        collectionView.register(UINib(nibName: CategoryCell.resusableIdentifier, bundle:nil), forCellWithReuseIdentifier: CategoryCell.resusableIdentifier)
    }
}

extension FeaturedAppsController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.resusableIdentifier, for: indexPath) as! CategoryCell
        if let appCategories = self.appCategories{
            cell.appCategory = appCategories[indexPath.row]
            return cell
        }
        
        return cell
    }
}

extension FeaturedAppsController: UICollectionViewDelegate {
    
}

extension FeaturedAppsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
}
