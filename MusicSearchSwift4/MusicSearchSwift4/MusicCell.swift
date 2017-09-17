//
//  MusicCell.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 13/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    @IBOutlet var trackName: UILabel!

    @IBOutlet var trackDetail: UILabel!
    @IBOutlet var trackIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
