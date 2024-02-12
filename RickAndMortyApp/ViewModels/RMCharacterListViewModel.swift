//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Mac on 11/02/2024.
//

import Foundation
import UIKit

final class RMCharacterListViewModel : NSObject {
    func fetchCharacters(){
        RMApiService.shared.execute(RMRequest.listCharacterRequest, expecting: AllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Image URL: " + String(model.results.first?.image ?? "No Image"))
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewModel : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else{
            fatalError("UnSupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Yomna", characterStatus: .alive, characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (UIScreen.main.bounds.width - 30) / 2,
            height: (UIScreen.main.bounds.width - 30) * 0.8
        )
    }
    
}
