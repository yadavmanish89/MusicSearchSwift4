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
    private var _cellData:TrackModel?
    var celldata:TrackModel? {
        get{
            return _cellData
        }
        set(celldata){
            self.trackName.text = celldata?.trackName
            self.artistName.text = celldata?.artistName
            _cellData = celldata
            DispatchQueue.global(qos: .background).async {
                ImageDownloader.getImageFromURL(urlStr: (celldata?.iconURL)!) { (image) in
                    DispatchQueue.main.async {
                        self.trackIcon.image = image
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
