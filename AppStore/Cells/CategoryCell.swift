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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        appsCollectionView.backgroundColor = .blue
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        
        appsCollectionView.register(UINib(nibName: AppsCell.resusableIdentifier, bundle: nil), forCellWithReuseIdentifier: AppsCell.resusableIdentifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .black
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
        return CGSize(width: 150, height: self.frame.height)
    }
    
}
