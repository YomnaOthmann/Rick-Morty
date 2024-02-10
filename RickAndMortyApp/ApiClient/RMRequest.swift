//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Mac on 10/02/2024.
//

import Foundation

/// Class that represent a single api request
final class RMRequest{
    
    /// API call constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// API Endpoints
    private let endpoint : RMEndPoint
    /// API Path Components, if Any
    private let pathComponents:Set<String>
    /// API Query Items, if Any
    private let queryParameters:[URLQueryItem]
    
    /// computed property for the api request in string format
    private var urlString:String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach { component in
                string += "/\(component)"
            }
        }
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else{
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    // MARK: - Public
    /// Desired Http Method
    public let httpMethod = "GET"
    
    /// Computed url
    public var url:URL?{
        return URL(string: urlString)
    }
    /// API Request Initializer
    /// - Parameters:
    ///   - endpoint: api endpoints
    ///   - pathComponents: collection of api path components
    ///   - queryParameters: collection of api query items
    public init(
        endpoint: RMEndPoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }

}
