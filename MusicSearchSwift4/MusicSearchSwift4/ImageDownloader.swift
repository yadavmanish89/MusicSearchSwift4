//
//  ImageDownloader.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 18/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader{
    class func getImageFromURL(urlStr:String,completion:(UIImage)->Void)  {
        do {
            
            guard let imageURL = URL.init(string: urlStr) else{
                return
            }
            let imgData = try Data.init(contentsOf:imageURL)
            guard let img = UIImage.init(data: imgData) else {
                return
            }
            completion(img)
        }
        catch let err{
            print(err.localizedDescription)
        }
    }
}
