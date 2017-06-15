//
//  MainTableViewCell.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/9.
//  Copyright © 2017年 witaction. All rights reserved.
//

import UIKit

// video 占位图
let PLACEHOLDER_VIDEO = "placeholder_blank"
class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var videoTime: UILabel!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var detailLab: UILabel!
    @IBOutlet weak var typeLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var watchNumLab: UILabel!
    @IBOutlet weak var commenNumLab: UILabel!
    
    @objc var model:DemoVideoModel? {
        
        didSet{
            
            headerImg.yy_setImage(with: URL(string: model!.poster!), placeholder: UIImage(named: PLACEHOLDER_VIDEO), options: [.showNetworkActivity, .setImageWithFadeAnimation, .progressiveBlur])
            videoTime.text = getTimeLengthStr(length: model!.length)
            typeLab.text = model?.typeStr
            timeLab.text = convertToDate(time: model!.time)
            titleLab.text = model?.title
            detailLab.text = model?.detail
            watchNumLab.text = "\(model!.view_number)"
            commenNumLab.text = "\(model!.comment_number)"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
