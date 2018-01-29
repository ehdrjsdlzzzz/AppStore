//
//  AppCategory.swift
//  AppStore
//
//  Created by 이동건 on 2018. 1. 29..
//  Copyright © 2018년 이동건. All rights reserved.
//

import Foundation
import Alamofire

class AppCategory {
    var name:String?
    var apps: [App]?
    var type:String?
    
    
    private static func getAppData(rawCategory: [String:Any]?)->AppCategory{
        let appCategory = AppCategory()
        if let rawCategory = rawCategory {
            if let name = rawCategory["name"] as? String {
                appCategory.name = name
            }
            if let rawApps = rawCategory["apps"] as? [[String:Any]] {
                var apps = [App]()
                for rawApp in rawApps {
                    let app = App()
                    if let id = rawApp["Id"] as? NSNumber {
                        app.id = id
                    }
                    if let name = rawApp["Name"] as? String {
                        app.name = name
                    }
                    if let category = rawApp["Category"] as? String {
                        app.category = category
                    }
                    if let price = rawApp["Price"] as? NSNumber {
                        app.price = price
                    }
                    if let imageName = rawApp["ImageName"] as? String {
                        app.imageName = imageName
                    }
                    apps.append(app)
                }
                appCategory.apps = apps
            }
            if let type = rawCategory["type"] as? String {
                appCategory.type = type
            }
        }
        return appCategory
    }
    static func fetchFeaturedApps(completion: @escaping ([AppCategory])->()) {
        Alamofire.request(Resource.URL).responseJSON { response in
            guard let result = response.result.value as? [String:Any] else {return}
            guard let categories = result["categories"] as? [[String:Any]] else {return}
            
            var AppCategories = [AppCategory]()
            
            for category in categories {
                AppCategories.append(getAppData(rawCategory: category))
            }
            
            completion(AppCategories)
        }
    }
}
