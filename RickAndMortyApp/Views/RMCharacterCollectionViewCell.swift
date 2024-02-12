//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Mac on 11/02/2024.
//

import UIKit

///  Single Character cell
class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "characterCell"
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private let statusLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
   
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubviews(imageView,nameLabel,statusLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unSupported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure (with viewModel:RMCharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)

                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5 ),
            
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -5 ),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor,constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,constant: -5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
