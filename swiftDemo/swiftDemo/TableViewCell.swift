//
//  TableViewCell.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/9.
//  Copyright © 2017年 witaction. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @objc var lab : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lab = UILabel(frame: Rect(x: 20, y: 5, w: 50, h: 30))
        lab.text = "精选"
        lab.backgroundColor = UIColor.gray
        contentView.addSubview(lab)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        let collection = UICollectionView(frame: Rect(x: 0, y: 35, w: SCREENW, h: 80), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.blue
        collection.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CollCell.self, forCellWithReuseIdentifier: "coll")
        contentView.addSubview(collection)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension TableViewCell : UICollectionViewDelegate{
    
}

extension TableViewCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coll", for: indexPath) as! CollCell
        cell.lab.text = "\(indexPath.item+1)"
        return cell
    }
}

class CollCell: UICollectionViewCell {
    @objc var lab:UILabel!
    @objc var _selected:Bool = false
    
    override var isSelected: Bool{
        set{
            _selected = newValue
            if _selected == true {
//                print("true==%@",self)
                contentView.backgroundColor = UIColor.red
            }else{
//                print("false==%@",self)
                contentView.backgroundColor = UIColor.groupTableViewBackground
            }
        }get{
            return _selected
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.groupTableViewBackground
        lab = UILabel(frame: self.bounds)
        lab.textAlignment = .center
        contentView.addSubview(lab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
