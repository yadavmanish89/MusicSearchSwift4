//
//  ViewController.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 11/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    var arr:Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewConfig()
        arr = readLocalJson()
    }
    
    func tableViewConfig()  {
        //        self.tableView.register(MusicCell.self, forCellReuseIdentifier: "musiccell")
//                self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "manish")
//        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 100
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arr?.count)!
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "manish", for: indexPath)
//        cell.textLabel?.text = arr?[indexPath.row]
        
        
 
//        let cell = tableView.dequeueReusableCell(withIdentifier: "musiccell", for: indexPath) as! MusicCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "musiccell2") as! MusicCell
        cell.trackName?.text = arr?[indexPath.row]

//        cell.trackName?.text = "\(indexPath.row+1)"
//        if(indexPath.row>4){
//            cell.trackIcon.image = UIImage.init(named: "black")
//        }else{
//            cell.trackIcon.image = UIImage.init(named: "manish")
//        }
 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap:\(indexPath.row)")
    }
    
    func readLocalJson() ->Array<String>? {
        do {
            let arr = try ReadJson.init().getLocalJson()
            return arr
        } catch let err {
            switch err {
            case MusicError.ObjectNotArray:
                print("Not Arr \(err.localizedDescription)")
            case MusicError.ObjectNotDictionary:
                print("Not Dict \(err.localizedDescription)")
            case MusicError.FilePathNotFound:
                print("File \(err.localizedDescription)")
            default:
                print("default \(err.localizedDescription)")
            }
        }
        return nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

