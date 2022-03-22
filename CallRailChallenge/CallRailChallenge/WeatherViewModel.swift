//
//  WeatherViewModel.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import Foundation
typealias CompletionHandler = (([Results])->())
class WeatherViewModel
{
    var array = [Results]()
    var error: Error?
    
    func fetchData(completionHandler: @escaping CompletionHandler)
    {
        guard let url = URL.init(string: "http://api.weatherapi.com/v1/forecast.json?key=d0f13b5fd0944cdbad5220500222103&q=London&days=1&aqi=no&alerts=no")
        else{return}
        
        URLSession.shared.dataTask(with: url)
        {(data, response, error) in
            if error == nil && data != nil {
                let jd = JSONDecoder.init()
                let result = try! jd.decode(WeatherModel.self, from: data!)
                self.error = nil
                print(result)
                completionHandler(result.results)
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
    
    func getWeatherIndex(index: Int) -> Results {
        return array[index]
    }
    
    func getCityName(results: Results)->String {
        let cityName = results.location.name
        return cityName
    }
    
    
    
}
