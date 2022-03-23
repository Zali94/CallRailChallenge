//
//  EarthQuakeViewModel.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//


//Main ViewModel Class. This will hold most of the bussines logic for this app

import Foundation
typealias CompletionHandler = (([Features])->())
class EarthQuakeViewModel
{
    //initial variables
    var array = [Features]()
    var error: Error?
    
    //main fetch API Handler here, will intialize URL and then decode the incoming JSON data as per our model
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
                completionHandler(result.features)
            }
            else {
                print(error?.localizedDescription ?? "Error")
            }
        }.resume()
    }
    
    //number of rows to populate for tableView
    func getRow() -> Int
    {
        return array.count
    }
    //return the index for items we will get the specific details for
    func getEarthQuakeIndex(index: Int) -> Features {
        return array[index]
    }
    //returns location details
    func getLocation(features: Features)->String {
        let location = features.properties.place
        return location
    }
    //returns mag details
    func getMagnitude(features: Features)->String {
        let mag = features.properties.mag
        
        return NSDecimalNumber(decimal: mag).stringValue
    }
    //returns time details along with formatting it in UTC
    func getTime(features: Features)->String {
        let time = features.properties.time
        
        let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        formatter.dateFormat = "hh:mm:ss"
        
        let formattedTime = formatter.string(from: date as Date)
        
        return formattedTime
    }
    //returns last upadated timings details with formatting it in UTC
    func getUpdated(features: Features)->String {
        let time = features.properties.updated
        
        let date = NSDate(timeIntervalSince1970: Double(time) / 1000)
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        formatter.dateFormat = "hh:mm:ss"
        
        let formattedTime = formatter.string(from: date as Date)
        
        return formattedTime
    }
    //returns tsunami details
    func getTsunami(features: Features)->String {
        let  indicator = features.properties.tsunami
        
        if(indicator == 0) {
            return "No Tsunami Occured"
        }
        return "Tsunami Occured"
    }
    //returns url details
    func getURL(features: Features)-> String {
        let url = features.properties.url
        return url
    }
    
}
