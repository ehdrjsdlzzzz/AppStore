//
//  CategoryCell.swift
//  AppStore
//
//  Created by 이동건 on 2018. 1. 29..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var appsCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var appCategory: AppCategory? {
        didSet {
            if let titleName = appCategory?.name {
                self.titleLabel.text = titleName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        
        appsCollectionView.register(UINib(nibName: AppsCell.resusableIdentifier, bundle: nil), forCellWithReuseIdentifier: AppsCell.resusableIdentifier)
        appsCollectionView.register(UINib(nibName: LargeAppCell.resusableIdentifier, bundle: nil), forCellWithReuseIdentifier: LargeAppCell.resusableIdentifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
    }
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let appCategories = self.appCategory, let apps = appCategories.apps{
            return apps.count
        }
        
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let _ = appCategory?.apps?.index(where: {$0.name != nil}) { // Name 존재 = Image
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.resusableIdentifier, for: indexPath) as! AppsCell
            cell.app = appCategory?.apps?[indexPath.item]
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeAppCell.resusableIdentifier, for: indexPath) as! LargeAppCell
            
            cell.app = appCategory?.apps?[indexPath.item]
            return cell
        }
    }
}

extension CategoryCell: UICollectionViewDelegate{
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let _ = appCategory?.apps?.index(where: {$0.name != nil}) {
            return CGSize(width: 100, height: self.frame.height - 32)
        }else{
            return CGSize(width: 220, height: self.frame.height - 32)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
