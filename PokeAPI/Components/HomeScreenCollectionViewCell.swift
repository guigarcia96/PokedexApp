//
//  HomeScreenCollectionViewCell.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell {
    
     lazy var cellImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     lazy var cellLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
        cellLabel.text = nil
        self.backgroundColor = .white
    }
    
    func setup(pokemons: Results, id:String){
        cellLabel.text = pokemons.name.capitalizingFirstLetter()
        cellImage.from(url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")
    }
    
    private func setupUI(){
        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)
        
        cellImage.widthAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true
        cellImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cellImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 8).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
}
