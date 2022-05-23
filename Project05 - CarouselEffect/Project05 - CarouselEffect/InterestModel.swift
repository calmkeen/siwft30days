//
//  InterestModel.swift
//  Project05 - CarouselEffect
//
//  Created by calmkeen on 2022/05/19.
//

import Foundation
import UIKit


class Info{
    var title = ""
    var context = ""
    var featuredImage: UIImage!
    var numberOfMembers = 0
    var numberOfPosts = 9
    
    init(title: String, context: String, featuredImage: UIImage!){
        self.title = title
        self.context = context
        self.featuredImage = featuredImage
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    static func Interest() -> [Info]{
        return
        [
        Info(title: "study", context: "study hard for me", featuredImage: UIImage(named: "study")),
        Info(title: "Camera", context: "Realism photo", featuredImage: UIImage(named:"Camera")),
        Info(title: "gmae", context: "playgame Apex", featuredImage: UIImage(named:"apex")),
        Info(title: "basketball", context: "play basketball", featuredImage: UIImage(named: "curry")),
        Info(title: "sleep", context: "it's really awesome", featuredImage: UIImage(named:"sleep"))
        ]
    }
}
