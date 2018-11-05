//
//  CardAnimationView.swift
//  App Store Transitions
//
//  Created by 이동건 on 05/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class CardAnimationView: UIView {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    static func initFromNib() -> CardAnimationView {
        let view = Bundle.main.loadNibNamed("CardAnimationView", owner: self, options: nil)?.first as! CardAnimationView
        return view
    }
}
