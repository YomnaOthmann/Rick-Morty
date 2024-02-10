//
//  Location.swift
//  RickAndMortyApp
//
//  Created by Mac on 27/01/2024.
//

import Foundation

struct RMLocation : Codable{
    var lat : Double
    var long : Double
    
    
    enum CodingKeys: String, CodingKey{
        case lat, long
    }
    
}
