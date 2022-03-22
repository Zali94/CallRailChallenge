//
//  weatherModel.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import Foundation


struct WeatherModel: Decodable
{
    let results : [Results]
}

struct Results: Decodable
{
    let location : Location
}


struct Location: Decodable
{
    let name: String
}
