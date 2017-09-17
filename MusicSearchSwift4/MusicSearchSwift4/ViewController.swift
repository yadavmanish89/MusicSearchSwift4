//
//  ViewController.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 11/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{//, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewConfig()
    }
    
    func tableViewConfig()  {
        //        self.tableView.register(MusicCell.self, forCellReuseIdentifier: "musiccell")
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "manish")
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 220
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "manish", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row+1)"
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "musiccell", for: indexPath) as! MusicCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "musiccell1") as! MusicCell
        cell.trackName?.text = "\(indexPath.row+1)"
        if(indexPath.row>4){
            cell.trackIcon.image = UIImage.init(named: "black")
        }else{
            cell.trackIcon.image = UIImage.init(named: "manish")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap:\(indexPath.row)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

