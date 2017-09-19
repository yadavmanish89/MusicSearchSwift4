//
//  WebService.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 17/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation

class WebSerview {
    static let shared = WebSerview()
    func getDataFromURL(searchStr:String,completion:@escaping (Data?,String)->Void)  {
        let urlStr = "https://itunes.apple.com/search?term=\(searchStr)"
        guard let urlObj = URL.init(string: urlStr) else {
            return
        }
        let urlRequest:URLRequest = URLRequest.init(url: urlObj)
        let config = URLSessionConfiguration.default
        let session = URLSession.init(configuration: config)
        let task = session.dataTask(with: urlRequest) { (data, response, err) in
            completion(data,searchStr)
        }
        task.resume()
    }
}
