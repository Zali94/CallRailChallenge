//
//  EarthQuakeViewModel.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//


import Foundation
typealias CompletionHandler = (([Features])->())
class EarthQuakeViewModel
{
    var array = [Features]()
    var error: Error?
    
    func fetchData(completionHandler: @escaping CompletionHandler)
    {
        guard let url = URL.init(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
        else{return}
        
        URLSession.shared.dataTask(with: url)
        {(data, response, error) in
            if error == nil && data != nil {
                let jd = JSONDecoder.init()
                let result = try! jd.decode(EarthquakeModel.self, from: data!)
                self.error = nil
                print(result)
                completionHandler(result.features)
            }
            else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
    func getRow() -> Int
    {
        return array.count
    }
    
    func getEarthQuakeIndex(index: Int) -> Features {
        return array[index]
    }
    
    func getLocation(features: Features)->String {
        let location = features.properties.place
        return location
    }
    
    
    
}
