//
//  ReadJson.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 17/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation
class ReadJson{
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
        } catch let err {
            print("Error\(err.localizedDescription)")
        }
        return nil
    }
}
