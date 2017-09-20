//
//  ReadJson.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 17/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation
class ReadJson{
    static let shared = ReadJson()
    func pasrseJsonFromData(jsonData:Data) -> Array<TrackModel> {
        var trackArr = [TrackModel]()
        do{
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments)
            guard let jsonDict = jsonObject as? Dictionary<String,Any> else {
                return trackArr
            }
            guard let resultArray = jsonDict["results"] as? [Dictionary<String, Any>]  else{
                return trackArr
            }
            for trackData in resultArray {
                var track = TrackModel.init()
                if let trackName = trackData["trackName"] as? String{
                    track.trackName = trackName
                }
                if let trackIcon = trackData["artworkUrl60"] as? String{
                    track.iconURL = trackIcon
                }
                if let previewUrl = trackData["previewUrl"] as? String{
                    track.previewURL = previewUrl
                }
                if let artist = trackData["artistName"] as? String{
                    track.artistName = artist
                }
                trackArr.append(track)
            }
            return trackArr
        }
        catch let err{
            print(err.localizedDescription)
        }
        return trackArr
    }
    
    func getLocalJson() throws -> Array<String>?{
        guard let filePath = Bundle.main.path(forResource: "Dummy", ofType: "geojson")else{
            throw MusicError.FilePathNotFound
        }
        do {
            let jsonData = try Data.init(contentsOf: URL.init(fileURLWithPath: filePath))
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments)
            guard let jsonObjectDict:Dictionary = jsonObject as? Dictionary<String,Any> else{
                throw MusicError.ObjectNotDictionary
            }
            guard let dataDict = jsonObjectDict["dataDict"] as? Dictionary <String,Any> else{
                throw MusicError.ObjectNotDictionary
            }
            if let dataArray = dataDict["dataArray"] as? Array<String>{
                return dataArray
            }
            else{
                throw MusicError.ObjectNotArray // just for try to throw in  binding
            }
        } catch let err {
            print("Error\(err.localizedDescription)")
        }
        return nil
    }
}
