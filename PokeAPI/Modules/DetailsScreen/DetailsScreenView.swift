//
//  DetailsScreenView.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 02/03/21.
//

import UIKit

protocol DetailsScreenViewContract {
    func setup(with: Pokemon, viewColor: UIColor)
}

class DetailsScreenView: UIView {
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 60
        return view
    }()
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var pokemonName: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeOne: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        label.layer.cornerRadius = 8.0
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeTwo: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        label.layer.cornerRadius = 8.0
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.addSubview(topView)
        topView.addSubview(imageView)
        self.addSubview(pokemonName)
        self.addSubview(stackView)
        stackView.addSubview(typeOne)
        stackView.addSubview(typeTwo)
        
        topView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -350).isActive = true
        
        imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 40).isActive = true
        imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        pokemonName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pokemonName.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 24).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 16).isActive = true
        
        typeOne.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: -60).isActive = true
        typeOne.heightAnchor.constraint(equalToConstant: 40).isActive = true
        typeOne.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        typeTwo.leadingAnchor.constraint(equalTo: typeOne.trailingAnchor, constant: 20).isActive = true
        typeTwo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        typeTwo.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
extension DetailsScreenView: DetailsScreenViewContract {
    func setup(with: Pokemon, viewColor: UIColor) {
        let imageURL = with.sprites.other.officialArtwork.frontDefault
        topView.backgroundColor = viewColor
        imageView.from(url: imageURL)
        pokemonName.text = with.name.capitalizingFirstLetter()
        typeOne.backgroundColor = viewColor
        typeTwo.backgroundColor = viewColor
        
        switch with.types.count {
        case 2:
            typeOne.text = with.types[0].type.name.capitalizingFirstLetter()
            typeTwo.text = with.types[1].type.name.capitalizingFirstLetter()
        case 1:
            typeOne.text = with.types[0].type.name.capitalizingFirstLetter()
            typeTwo.text = "N/A"
        case 0:
            typeOne.text = "N/A"
            typeTwo.text = "N/A"
        default:
            return
        }
        
        
    
        
    }
}
