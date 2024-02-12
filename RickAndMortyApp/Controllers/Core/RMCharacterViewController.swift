//
//  RMCharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Mac on 27/01/2024.
//

import UIKit

/// ViewController for viewing and searching for characters
final class RMCharacterViewController: UIViewController {

    private var characteListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        view.addSubview(characteListView)
        setUpViewConstraints()
        
    }
    private func setUpViewConstraints(){
        NSLayoutConstraint.activate([
            characteListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            characteListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            characteListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            characteListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
