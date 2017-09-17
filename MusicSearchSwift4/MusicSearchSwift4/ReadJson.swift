//
//  ReadJson.swift
//  MusicSearchSwift4
//
//  Created by MANISH on 17/09/17.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation

func getLocalJson() throws{
    guard let filePath = Bundle.main.path(forResource: "Dummy", ofType: "geojson")else{
        return
    }
    do {
        let jsonData = try Data.init(contentsOf: URL.init(fileURLWithPath: filePath))
    } catch let err {
        print("Error\(err.localizedDescription)")
    }
}
