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
   
    /// enum for fetching error messages
    enum RMServiceError:Error{
        case failedToCreateRequest
        case failedToFetchData
        case failedToDecodeData
    }
   
    /// Sends Api reauest
    /// - Parameters:
    ///   - request: request instance  
    ///   - type: The type of returned object 
    ///   - completion: callback with data or error
    func execute<T:Codable>(
        _ request:RMRequest,
        expecting type : T.Type,
        completion: @escaping(Result<T,Error>)->Void
    ){
        guard let request = self.request(from: request) else{
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else{
                completion(.failure(RMServiceError.failedToFetchData))
                return
            }
            // Decode response
            do{
                let data = try JSONDecoder().decode(type.self, from: data)
                completion(.success(data))
                print(String(describing: data))
            }catch {
                completion(.failure(RMServiceError.failedToDecodeData))
            }
        }
        task.resume()
        
        
    }
    
    //MARK: - Private
    private init(){}
    
    /// make an URL Request from RMRequest
    /// - Parameter rmRequest: rmRequest
    /// - Returns: urlRequest
    private func request(from rmRequest:RMRequest)->URLRequest?{
        guard let url = rmRequest.url else{
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
