//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Mac on 10/02/2024.
//

import Foundation

/// Enum of Unique API Endpoints
@frozen enum RMEndPoint : String{
    /// Endpoint to get location data
    case location
    /// Endpoint to get characters data
    case character
    /// Endpoint to get episodes data
    case episode
}
