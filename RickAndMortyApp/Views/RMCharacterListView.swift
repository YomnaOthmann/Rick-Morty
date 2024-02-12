//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Mac on 11/02/2024.
//

import UIKit


/// View that handles and shows characters and UI Activity Indicator
class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewModel()
    private let indicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)

        return collectionView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(indicator,collectionView)
        addConstraints()
        indicator.startAnimating()
        viewModel.fetchCharacters()
        
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            indicator.widthAnchor.constraint(equalToConstant: 100),
            indicator.heightAnchor.constraint(equalToConstant: 100),
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo:bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo:leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo:trailingAnchor)
            
        ])
    }
    
    private func setUpCollectionView(){
        
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:{
            self.indicator.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
}
