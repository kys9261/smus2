//
//  WeekDayViewController.swift
//  smus
//
//  Created by kim-yongseong on 2017. 1. 19..
//  Copyright © 2017년 YongSeongKim. All rights reserved.
//

import UIKit

class WeekDayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var location: String?
    var vacation: Bool?
    let screenSize:CGRect = UIScreen.main.bounds
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var timeTableView: UITableView!
    
    var caCamController: caCampusController? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        let tabBarCont = self.tabBarController as! TimeTabViewController
        self.location = tabBarCont.location
        self.vacation = tabBarCont.vacation
        
        //time table top view setting
        setTitleView(location: "caCampus");
        
        //time table setting
        timeTableView.delegate = self
        timeTableView.dataSource = self
        
        self.timeTableView?.tableFooterView = UIView()
        
        
        //controller init
        //if location == "caCampus"{
         //   caCamController = caCampusController(vacation: false)
        //}

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func topBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height) + (self.navigationController?.navigationBar.frame.size.height)!
    }
    
    func setTitleView(location: String){
        let view = Bundle.main.loadNibNamed(location, owner: self, options: nil)?.first as! UIView
        view.frame = CGRect(x:0 , y:topBarHeight(), width:screenSize.width, height:50)
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7232277393, blue: 0.9604390264, alpha: 1)
        self.view.addSubview(view)
    }
    
    let titles = ["Hello", "Swift", "programming"]

    
    // 테이블 행수 얻기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (caCamController?.cellSize())!
    }
    
    
    // 셀 내용 변경하기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (caCamController?.getCell(location: "caCampus", row: indexPath.row))!
    }
    
    // 왼쪽 공백 제거
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(self.timeTableView.responds(to: #selector(setter: UITableViewCell.separatorInset))) {
            self.timeTableView.separatorInset = UIEdgeInsets.zero
        }
        
        
        if(self.timeTableView.responds(to: #selector(setter: UIView.layoutMargins))) {
            self.timeTableView.layoutMargins = UIEdgeInsets.zero
        }
        
        if(cell.responds(to: #selector(setter: UIView.layoutMargins))) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
