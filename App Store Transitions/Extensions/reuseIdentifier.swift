//
//  reuseIdentifier.swift
//  App Store Transitions
//
//  Created by 이동건 on 04/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
