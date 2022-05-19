//
//  collectionViewCell.swift
//  Project05 - CarouselEffect
//
//  Created by calmkeen on 2022/05/19.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var featuredimageView: UIImageView!
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    var info: Info! {
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        featuredimageView?.image! = info.featuredImage
        infoTitleLabel?.text! = info.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //레이어의 테두리 설정
        self.layer.cornerRadius = 15.0
        //clipsToBounds는 설정한 뷰안에 테두리나 설정값 등을 맞춰서 가둘수 있는지를 정하는 변수
        self.clipsToBounds = true
    }
}
