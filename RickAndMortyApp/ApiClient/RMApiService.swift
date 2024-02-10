//
//  RMApiService.swift
//  RickAndMorty
//
//  Created by Mac on 10/02/2024.
//

import Foundation

/// RMApiService is the primary api service class that handle fetching Rick&Morty data
final class RMApiService{
    
    /// This is the shared singleton instance
    static let shared = RMApiService()
    
    private init(){}
    
    /// Sends Api reauest
    /// - Parameters:
    ///   - request: request instance  
    ///   - completion: callback with data or error
    func execute(_ request:RMRequest, completion: @escaping()->Void){
        
    }
}
