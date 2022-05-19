//
//  ViewController.swift
//  Project04 - SnapChatMenu
//
//  Created by calmkeen on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCameraView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpCameraView() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        guard let leftView: UIViewController = UINib(nibName: "LeftView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIViewController else {
            return
        }
        let centerView: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)
        
        leftView.view.frame = CGRect(x: 0, y: 0, width: screenWidth-200, height: screenHeight)
        centerView.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightView.view.frame = CGRect(x: 2*screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        // SCrollView 설정
        self.scrollView.addSubview(leftView.view)
        self.scrollView.addSubview(rightView.view)
        self.scrollView.addSubview(centerView.view)
        self.scrollView.contentSize = CGSize(width: screenWidth * 3, height: screenHeight)
        
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
}
