//
//  ModelData.swift
//  Landmaks
//
//  Created by fasih zaidi on 08/07/2024.
//

import Foundation

@Observable
class ModelData
{
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    var features: [Landmark]
    {
        landmarks.filter
        {
            $0.isFeatured
        }
    }
    var categories: [String: [Landmark]]
    {
        Dictionary(
            grouping: landmarks, by:{$0.category.rawValue}
        )
    }
}

var landmarks: [Landmark] = load("landmarkData.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
else
    {
        fatalError("couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("couldn't load \(filename) from main bundle: \n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch
    {
        fatalError("couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
