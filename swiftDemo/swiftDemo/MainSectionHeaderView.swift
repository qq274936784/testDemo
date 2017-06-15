//
//  MainSectionHeaderView.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/9.
//  Copyright © 2017年 witaction. All rights reserved.
//

import UIKit

class MainSectionHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let timeStr = getTimeStr()
        
        titleLab.text = timeStr+"  I  24小时精选"
    }
    
    private func getTimeStr() -> String {
        let calendar = Calendar.current
        let com = (calendar as NSCalendar).components([.month, .day], from: Date())
        let month = com.month
        let day = com.day
        let monthStr = getMonthStr(month: month!)
        let timeStr = String.init(format: "%@%02d", arguments: [monthStr, day!])
        return timeStr

    }

    private func getMonthStr(month: Int) -> String {
        switch month {
        case 1:
            return "Jan."
        case 2:
            return "Feb."
        case 3:
            return "Mar."
        case 4:
            return "Apr."
        case 5:
            return "May."
        case 6:
            return "Jun."
        case 7:
            return "Jul."
        case 8:
            return "Aug."
        case 9:
            return "Sep."
        case 10:
            return "Oct."
        case 11:
            return "Nov."
        case 12:
            return "Dec."
        default:
            return ""
        }
    }
}
