//
//  ViewController.swift
//  Project05 - CarouselEffect
//
//  Created by calmkeen on 2022/05/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate var info = Info.Interest()
    
    
    
    override var stautsStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    fileprivate struct Storyboard {
        static let CellIdentifier = "InterestCell"
        static let CellPadding: CGFloat = 20.0
    }
}
    extension homeViewController: UICollectionViewDataSource{
        
    }



