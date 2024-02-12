//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Mac on 11/02/2024.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
   public let characterName:String
   private let characterStatus:RMCharacterStatus
   private let characterImageUrl:URL?
    
    public var characterStatusText:String {
        return characterStatus.rawValue
    }
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public func fetchImage(completion:@escaping(Result<Data,Error>)->Void){
        
        //TODO: - Abstract to image manager
        
        guard let url = characterImageUrl else{
            completion(.failure(URLError(URLError.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                completion(.failure(error ?? URLError(URLError.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
