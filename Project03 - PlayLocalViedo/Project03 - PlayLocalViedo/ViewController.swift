//
//  ViewController.swift
//  Project03 - PlayLocalViedo
//
//  Created by calmkeen on 2022/05/10.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var videoTableView: UITableView!
    
    private var cellIdentifier = "VideoCell"
    
    
    private var videoData = [
        VideoData(image: "도라에몽",
                  title: "Introduce 3DS Mario",
                  source: "Youtube - 06:32"),
        VideoData(image: "귀멸의칼날",
                  title: "Emoji Among Us",
                  source: "Vimeo - 3:34"),
        VideoData(image: "짱구",
                  title: "Seals Documentary",
                  source: "Vine - 00:06"),
        VideoData(image: "원피스",
                  title: "Adventure Time",
                  source: "Youtube - 02:39"),
        VideoData(image: "주술회전",
                  title: "Facebook HQ",
                  source: "Facebook - 10:20"),
        VideoData(image: "귀멸의칼날",
                  title: "Lijiang Lugu Lake",
                  source: "Allen - 20:30")
    ]
    
    
    
    //뷰 라이프 사이클에서 메모리를 관리해주는 것으로 오래된 메모리를 자동으로 해제해서 관리하는 코드
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private var playViewController = AVPlayerViewController()
    private var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicBbtn(_ sender: AnyObject){
        let path = Bundle.main.path(forResource: "sampleVideo", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        playerView = AVPlayer(url: url)
        
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! VideoCell
        let videoData = videoData[indexPath.row]
        
        cell.videoTitle.text = videoData.title
        cell.screenShot.image = UIImage(named: videoData.image)
        cell.videoSourceLabel.text = videoData.source
        return cell
    
    }
}
