//
//  VideoCellController.swift
//  Project03 - PlayLocalViedo
//
//  Created by calmkeen on 2022/05/10.
//

import UIKit
// 유튜브에서 가져오려면 avFoundation이 아닌 avkit 도 필요
import AVKit





class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoSourceLabel: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var screenShot: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
