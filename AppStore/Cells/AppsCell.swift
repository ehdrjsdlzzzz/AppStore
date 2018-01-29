//
//  AppsCell.swift
//  AppStore
//
//  Created by 이동건 on 2018. 1. 29..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class AppsCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var app: App? {
        didSet {
            if let name = app?.name {
                nameLabel.text = name
            }
            if let image = app?.imageName {
                imageView.image = UIImage(named: image)
            }
            if let category = app?.category {
                categoryLabel.text = category
            }
            if let price = app?.price {
                priceLabel.text = "$\(price)"
            }else {
                priceLabel.text = ""
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.image = nil
        nameLabel.text = nil
        categoryLabel.text = nil
        priceLabel.text = nil
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        nameLabel.numberOfLines = 2
        categoryLabel.textColor = .darkGray
        priceLabel.textColor = .darkGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        nameLabel.text = nil
        categoryLabel.text = nil
        priceLabel.text = nil
    }
}
