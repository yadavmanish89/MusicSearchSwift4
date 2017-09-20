//
//  PlayerViewController.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 19/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit
import WebKit
class PlayerViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var selectedTrack:TrackModel?
    @IBOutlet var trackName: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var artistName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                populateData()
//
    }

    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        loadWebView()
    }
    
    func populateData() {
        self.trackName.text = selectedTrack?.trackName
        self.artistName.text = selectedTrack?.artistName
        DispatchQueue.global(qos: .background).async {
            ImageDownloader.getImageFromURL(urlStr: (self.selectedTrack?.iconURL)!) { (image) in
                DispatchQueue.main.async {
                    self.iconImageView.image = image
                }
            }
        }
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        guard let urlStr = selectedTrack?.previewURL else{
            return
        }
        guard let url = URL.init(string:urlStr) else{
            return
        }

        UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
