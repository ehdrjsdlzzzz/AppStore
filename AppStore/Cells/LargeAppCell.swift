//
//  LargeAppCell.swift
//  AppStore
//
//  Created by 이동건 on 2018. 2. 4..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class LargeAppCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var app: App? {
        didSet {
            if let image = app?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.image = nil
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
    }

}
