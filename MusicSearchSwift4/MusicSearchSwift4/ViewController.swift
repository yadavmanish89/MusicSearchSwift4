//
//  ViewController.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 11/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
//    var jsonarr:Array<String>?
    var dataArr = [TrackModel]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tableViewConfig()
//        jsonarr = readLocalJson()
        loadData()
    }
    
    func tableViewConfig()  {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
    }

    func loadData()  {
        WebSerview.shared.getDataFromURL(urlStr: "he") { [weak self](response) in
            guard let responseData = response else{
                return
            }
            self?.dataArr = ReadJson.shared.pasrseJsonFromData(jsonData: responseData)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "musiccell", for: indexPath) as! MusicCell

        cell.configureCell(data: self.dataArr[indexPath.row])
        
 
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

