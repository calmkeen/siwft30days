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
    
    init(title: String, context: String, feaaturedImage: UIImage){
        self.title = title
        self.context = context
        self.featuredImage = featuredImage
        self.numberOfPosts = 1
        self.numberOfMembers = 1
    }
    
    static func Interest() -> [Info]{
        
        return
        [
        Info(title: "study", context: "study hard for me", feaaturedImage: UIImage(name: "study"))
        Info(title: "Camera", context: "Realism photo", feaaturedImage: UIImage(name:"Camera"))
        Info(title: "gmae", context: "playgame Apex", feaaturedImage: UIImage(name:"apex"))
        Info(title: "basketball", context: "play basketball", feaaturedImage: UIImage(named: "curry"))
        Info(title: "sleep", context: "it's really awesome", feaaturedImage: UIImage(name:"sleep"))
        ]
    
    
}
