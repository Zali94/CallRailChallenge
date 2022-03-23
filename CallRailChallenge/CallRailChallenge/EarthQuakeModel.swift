//
//  EarthQuakeModel.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import Foundation

//setting up Model to decode in coming API JSON data
struct EarthquakeModel: Decodable
{
    //will store data into an array format
    let features : [Features]
}

struct Features: Decodable
{
    let properties : Properties
}

struct Properties: Decodable
{
    let place :  String
    let mag: Decimal
    let time: CLong
    let updated: CLong
    let tsunami: Int
    let url: String
    
}
