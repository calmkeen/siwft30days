//
//  ViewController.swift
//  RandomGradientColorMusic
//
//  Created by calmkeen on 2022/06/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var playbtn: UIButton!

    var audioPlayer = AVAudioPlayer()
    var gradientLayer = CAGradientLayer()
    var timer: Timer?
    
    var backgroundColor: (red:CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)!{
        didSet{
            let color1 = UIColor(red: backgroundColor.blue,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    
    
    
    @IBAction func playBtn(_ sender: AnyObject){
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Music1", ofType: "mp3"))
        
        do {
                   try AVAudioSession.sharedInstance().setCategory(playbtn)
                   try AVAudioSession.sharedInstance().setActive(true)
                   try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
                   
                   audioPlayer.prepareToPlay()
                   audioPlayer.play()
                   
               }
               catch let audioError as NSError {
                   print(audioError)
               }
               
               if (timer == nil) {
                   timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
               }
               
               let redValue = CGFloat(drand48())
               let blueValue =  CGFloat(drand48())
               let greenValue = CGFloat(drand48())
               
               self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
               
               //graditent color
               gradientLayer.frame = view.bounds
               gradientLayer.startPoint = CGPoint(x: 0, y: 0)
               gradientLayer.endPoint = CGPoint(x: 1, y: 1)
             
               self.view.layer.addSublayer(gradientLayer)
    }

    @objc func randomColor() {
          
          let redValue = CGFloat(drand48())
          let blueValue =  CGFloat(drand48())
          let greenValue = CGFloat(drand48())
          
          
          backgroundColor = (redValue, blueValue, greenValue, 1)
          
      }
}

