//
//  MusicCell.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 13/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    @IBOutlet private var trackName: UILabel!
    @IBOutlet private var artistName: UILabel!
    @IBOutlet private var trackIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(data:TrackModel){
        self.trackName.text = data.trackName
        self.artistName.text = data.artistName
        
        DispatchQueue.global(qos: .background).async {
            ImageDownloader.getImageFromURL(urlStr: data.iconURL!) { (image) in
                DispatchQueue.main.async {
                    self.trackIcon.image = image
                }
            }
        }
        
//        DispatchQueue.main.async {
//            ImageDownloader.getImageFromURL(urlStr: data.iconURL!) { (image) in
//                DispatchQueue.main.async {
//
//                    self.trackIcon.image = image
//                }
//            }
//        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
