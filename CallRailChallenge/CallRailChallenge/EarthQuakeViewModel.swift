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
    
    func getMagnitude(features: Features)->String {
        let mag = features.properties.mag
        
        return NSDecimalNumber(decimal: mag).stringValue
    }
    
    func getTime(features: Features)->String {
        let time = features.properties.time
        
        let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        formatter.dateFormat = "hh mm ss"
        
        let formattedTime = formatter.string(from: date as Date)
        
        return formattedTime
    }
    
    func getUpdated(features: Features)->String {
        let time = features.properties.updated
        
        let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        formatter.dateFormat = "hh mm ss"
        
        let formattedTime = formatter.string(from: date as Date)
        
        return formattedTime
    }
    
    func getTsunami(features: Features)->String {
        let  indicator = features.properties.tsunami
        
        if(indicator == 0) {
            return "No Tsunami Occured"
        }
        return "Tsunami Occured"
    }
    
    func getURL(features: Features)-> String {
        let url = features.properties.url
        return url
    }
    
}
