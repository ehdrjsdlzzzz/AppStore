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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "Best New Apps"
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        
        appsCollectionView.register(UINib(nibName: AppsCell.resusableIdentifier, bundle: nil), forCellWithReuseIdentifier: AppsCell.resusableIdentifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
    }
}

extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.resusableIdentifier, for: indexPath) as! AppsCell
        
        return cell
    }
}

extension CategoryCell: UICollectionViewDelegate{
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: self.frame.height-30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
