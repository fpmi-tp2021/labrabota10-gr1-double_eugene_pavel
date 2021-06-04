//
//  Config.swift
//  Plant Activity Tracker
//
//  Created by Pavel on 6/1/21.
//

import Foundation

struct Config: Decodable {
    // add keys here
    let MyPlant1: MyPlant
    let MyPlant2: MyPlant
    let MyPlant3: MyPlant
}

struct MyPlant: Decodable {
    let title: String
    let image: String
    
}

struct ConfigValues {
    static func get() -> Config {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Could not find Config.plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
