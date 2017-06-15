//
//  ViewController.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/9.
//  Copyright © 2017 witaction. All rights reserved.
//

import UIKit


private let ImageViewH:CGFloat = SCREENW*(750/1334)
// Size
let ListCellHeight: CGFloat = SCREENW*(420/750)

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate {
    
    @objc var isAnimation:Bool = false
    
    @objc var dataArr = [DemoVideoModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.setupUI()
        
        self.getData()
        
    }
    
    
    private func getData() {
        DemoVideoModel.setupData { (array) in
            print(array)
            dataArr = array
            tableView.reloadData()
        }
    }
    @objc func singleTapAction () -> Void {
        if isAnimation {
            return
        }else{
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.delegate = self as? CAAnimationDelegate
            rotationAnimation.toValue = M_PI * 2.0
            rotationAnimation.duration = 2.0
            rotationAnimation.isCumulative = true
//            rotationAnimation.repeatCount = 2
            rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            logView.layer.add(rotationAnimation, forKey: "rotationAnimation")
            
            let keyBoundAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
            keyBoundAnimation.keyTimes = [0.0,0.2,0.4,0.5,0.8,1.0]
            keyBoundAnimation.values   = [1.0,1.6,1.3,1.5,1.1,1.0]
//            keyBoundAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
 
            let opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue = 0.3
            opacityAnimation.toValue = 1
//            opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

            
            let groupAnimation = CAAnimationGroup()
            groupAnimation.animations = [keyBoundAnimation,opacityAnimation]
            groupAnimation.duration = 2
//            groupAnimation.isRemovedOnCompletion = false
//            groupAnimation.fillMode = kCAFillModeForwards
            imageView.layer.add(groupAnimation, forKey: "groupAnimation")
            
            isAnimation = true
        }
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        isAnimation = false
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(logView)
        view.addSubview(tableView)
        
        logView.center = imageView.center
        tableView.responsView = logView
    }
    
    // MARK: - Lazy load
    fileprivate lazy var imageView:UIImageView = {
        let imageView = UIImageView(frame: Rect(x: 0, y: 0, w: SCREENW, h: ImageViewH))
        imageView.image = UIImage(named: "list_header")
        return imageView
    }()
    
    fileprivate lazy var logView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "list_daily special"))
        imageView.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapAction))
        imageView.addGestureRecognizer(singleTap)
        return imageView
    }()
    
    fileprivate lazy var tableView:MainTableView = {
        let tableView = MainTableView(frame: Rect(x: 0, y: 0, w: SCREENW, h: SCREENH), style: .plain)
        
        let headView = UIView(frame: Rect(x: 0, y: 0, w: SCREENW, h: ImageViewH))
        headView.backgroundColor = UIColor.clear
        tableView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = headView
        
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "MainSectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    
    


}
// MARK: - Table View Delegate
extension ViewController{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListCellHeight+140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY<0 {
            imageView.height = ImageViewH-offsetY
            imageView.width = imageView.height*(1334/750)
            imageView.centerX = view.centerX
            logView.center = imageView.center
            
        }else{
            let alpha = offsetY/ImageViewH
            tableView.tableHeaderView?.backgroundColor = RGB(r: 0x00, g: 0x00, b: 0x00, alpha: alpha*0.9);
            if offsetY >= ImageViewH{
                UIApplication.shared.statusBarStyle = .default
            }else{
                UIApplication.shared.statusBarStyle = .lightContent
            }
        }
        
    }
}

// MARK: - Table View Data Source
extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.model = dataArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return headerView
    }
}
