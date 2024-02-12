//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Mac on 11/02/2024.
//

import Foundation

struct AllCharacterResponse:Codable{
    let info: AllCharacterResponseInfo
    let results: [RMCharacter]
}
struct AllCharacterResponseInfo:Codable{
    let count:  Int
    let pages:  Int
    let next:  String?
    let prev:  String?
}
      
