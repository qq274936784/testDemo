//
//  DemoVideoModel.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/12.
//  Copyright © 2017年 witaction. All rights reserved.
//

import UIKit

class DemoVideoModel: NSObject {
    
    @objc var detail: String?
    
    @objc var share_number: Int = 0
    
    @objc var director: String?
    
    @objc var video_id: Int = 0
    
    @objc var chapter: Int = 0
    
    @objc var view_number: Int = 0
    
    @objc var charge: Int = 0
    
    @objc var time: Int = 0
    
    @objc var user_id: Int = 0
    
    @objc var comment_number: Int = 0
    
    @objc var title: String?
    
    @objc var length: Int = 0
    
    @objc var play_id: Int = 0
    
    @objc var actor: String?
    
    @objc var type: Int = 0
    
    @objc var poster: String?
    
    @objc var like_number: Int = 0
    
    @objc var status: Int = 0
    
    @objc var play_address: String?
    
    @objc var typeStr : String {
        get{
            switch type {
            case 1:
                return "剧集"
            case 2:
                return "MV"
            case 3:
                return "影视"
            case 4:
                return "自制"
            case 5:
                return "创作"
            case 6:
                return "搞笑"
            default:
                return "其他"
            }
        }
    }
    
    
    @objc init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    @objc class func setupData(success: ([DemoVideoModel])->Void) {
        
        var videoArr = [DemoVideoModel]()
        
        let path = Bundle.main.path(forResource: "video", ofType: nil)

        do {
            let date = NSData(contentsOf: URL.init(fileURLWithPath: path!))
            
            let dateDict = try JSONSerialization.jsonObject(with: date! as Data, options:.mutableContainers) as! [String:Any]
            
            let dataArray = dateDict["data"] as! Array<[String:Any]>
            
            for dict in dataArray {
                let model = DemoVideoModel(dict: dict)
                videoArr.append(model)
            }
            success(videoArr)
        } catch {
            print(error)
        }
    }
    
    
    
}


