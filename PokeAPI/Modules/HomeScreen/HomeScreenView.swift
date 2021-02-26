//
//  HomeScreenView.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import UIKit

class HomeScreenView: UIView {
    
    var viewModel = HomeScreenViewModel()
    let pokemonCellId = "pokemonCellId"
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .darkGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeScreenCollectionViewCell.self, forCellWithReuseIdentifier:pokemonCellId )
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierachy()
        setupConstraints()
        configure()
        reloadData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    func reloadData(){
        collectionView.reloadData()
    }
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func setupHierachy(){
        self.addSubview(collectionView)
    }
}

extension HomeScreenView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.poke.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pokemonCellId, for: indexPath) as? HomeScreenCollectionViewCell
        cell?.setup(pokemons: viewModel.poke[indexPath.row], id: viewModel.getPokemonId(indice: indexPath.row))
        cell?.backgroundColor = viewModel.generateRandomColor()
        cell?.layer.cornerRadius = 12
        cell?.layer.masksToBounds = true
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2-1
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.getPokemonsCount() - 2{
            updateNextSet()
        }
        
    }
    func updateNextSet(){
        if let next = viewModel.pokemons?.next {
            viewModel.getPokemons(url: next)
        }
    }
}
