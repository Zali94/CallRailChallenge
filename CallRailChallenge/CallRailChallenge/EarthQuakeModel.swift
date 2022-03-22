//
//  EarthQuakeModel.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import Foundation

struct EarthquakeModel: Decodable
{
    let features : [Features]
}

struct Features: Decodable
{
    let properties : Properties
}

struct Properties: Decodable
{
    let place :  String
}
